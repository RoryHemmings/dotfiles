import os

def usage_exit():
    print("Invalid Config Format")
    print("Should be:")
    print('"<local file name>" -> "<output directory>"')
    exit()

def parse_config():
    ret = {}
    with open("dotdirs.txt", "r") as config:
        for line in config.readlines():
            if line.strip() == '':
                continue
            parts = [] 
            for part in line.split("->"):
                parts.append(part.strip().replace('"', '').replace('~', os.environ['HOME']))

            if (len(parts) > 2):
                usage_exit()

            ret[parts[0]] = parts[1]

    return ret

def backup_file(path_out, data):
    try:
        with open('backup/'+path_out, 'w') as output:
            output.write(data)
    except FileNotFoundError:
        print('Could not back up dotfiles')
        print('Make sure create a backup/ sub-directory in this directory')
        exit()

def sync_file(path, path_out):
    print("\n** Syncing File: {} to {} **".format(path, path_out))

    data = ''

    try:
        with open(path, 'r') as infile:
            data = infile.read()

        if data == '':
            print('Dotfile {} is empty'.format(path))

    except FileNotFoundError:
        print("Sync Failed: Could not open File {}".format(path))
        return False


    try:
        with open(path_out, 'r') as outfile:
            old_data = outfile.read()
            backup_file(path + ".original", old_data)
    
        with open(path_out, 'w') as outfile:
            outfile.write(data)

    except FileNotFoundError:
        print("Sync Failed: Could not open file {}".format(path_out))
        return False

    return True

def main():
    dirs = parse_config()

    successful = []
    failed = []
    for file in dirs:
        if sync_file(file, dirs[file]):
            successful.append((file, dirs[file]))
        else:
            failed.append((file, dirs[file]))

    print('\n------- Sync Complete --------')
    print('\nSucessfully synced {} Files:'.format(len(successful)))
    for x in successful:
        print('{} -> {}'.format(x[0], x[1]))

    print('\nFailed to sync {} Files:'.format(len(failed)))
    for x in failed:
        print('{} -> {}'.format(x[0], x[1]))

if __name__ == "__main__":
    main()

