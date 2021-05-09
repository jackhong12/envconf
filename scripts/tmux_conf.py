#!python3
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('config', type=str, help="config file name")
args = parser.parse_args()

f = open(args.config)

