# Citrix Task

For my initial task as Intern, I made this project to compare 2 json files from python to spot differences between them.

The idea is to use the above program to compare outputs of Route table json files. (1) Create VM (Vnet and Subnet) from azure cli (2)Create a route table associated to that subnet (3) use command "az cli show" to extract output of route table in json format (4) compare 2 different json files by changing the route table. Follow up- Try to do above procedure using teraform instead of azure cli.
## Idea

The idea is to use the above program to compare outputs of Route table json files.
 (1) Create VM (Vnet and Subnet) from azure cli
 (2)Create a route table associated to that subnet
 (3) use command "az cli show" to extract output of route table in json format
 (4) compare 2 different json files by changing the route table. Follow up- Try to do above procedure using teraform instead of azure cli.

## Usage

Clone the current github from [here](https://github.com/aditya-vaish5/CitrixTasks) using command :


```bash
git clone https://github.com/aditya-vaish5/CitrixTask
```

Next run comamnd
```bash
python spot_diff ./output1.json ./output2.json
```

