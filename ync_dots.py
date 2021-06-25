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
                parts.append(part.strip().replace('"', ''))

            if (len(parts) > 2):
                usage_exit()

            ret[parts[0]] = parts[1]

    return ret

def backup_file(path_out, data):
    with open('backup/'+path_out, 'w') as output:
        output.write(data)

def sync_file(path, path_out):
    data = ''
    with open(path, 'r') as infile:
        data = infile.read()

    if data == '':
        print('Dotfile {} is empty'.format(path))

    with open(path_out, 'r') as outfile:
        old_data = outfile.read()
        backup_file(path + ".original", old_data)

    with open(path_put, 'w') as outfile:
        outfile.write(data)

def main():
    dirs = parse_config()
    for file in dirs:
        sync_file(file, dirs[file])

if __name__ == "__main__":
    main()


