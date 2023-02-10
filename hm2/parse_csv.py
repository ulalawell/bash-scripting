import argparse
import pandas as pd
from sklearn.datasets import load_svmlight_file

parser = argparse.ArgumentParser(description='convert LibSVM dataset to csv')
parser.add_argument('input_file', type=str, help='libSVM dataset')
parser.add_argument('output_file', type=str, help='output csv file')
args = parser.parse_args()

data, target = load_svmlight_file(args.input_file)

df = pd.DataFrame(data=data.todense())
df.columns += 1
df['target'] = target
df.to_csv(args.output_file, index=False)
