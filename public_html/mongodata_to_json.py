import json
import re
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--file', help='input file path', required=True)
parser.add_argument('--output', help='output file path', required=True)
args = parser.parse_args()

if args.file and args.output:
    formatted_json = []
    with open(args.file) as json_file:
        for line in json_file:
            data = line
            match = re.findall(r"(NumberInt\((\d+)\))", data)
            if match:
                data = data.replace(match[0][0], match[0][1])
            formatted_json.append(json.loads(data))
    pp_json = open(args.output, 'w')
    pp_json.write(json.dumps(formatted_json, indent=4, sort_keys=True, ensure_ascii=False).encode('utf8'))
    pp_json.close()