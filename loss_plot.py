import matplotlib.pyplot as plt
import pandas as pd
import argparse
import os
import re
import glob

def read_log(file):
    df = pd.read_csv(file, usecols=[0,1], header=0)
    return df


def retrieve_logs(folder):
    return glob.glob(os.path.join(folder, "**/loss*.csv"), recursive=True)


def read_logs(folder):
    logs = retrieve_logs(folder)
    return [read_log(log) for log in logs]


def do_plots(root_dirs):
    ax = None
    for root_dir in root_dirs:
        datasets = read_logs(root_dir)
        for data in datasets:
            ax = data.set_index("epoch").plot(
                ax=ax,
                lw=0.5,
                ylabel="loss"
            )


def main():
    parser = argparse.ArgumentParser(
        description="Generate plots of losses for an experiment run",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )

    parser.add_argument(
        "root_dirs",
        type=str,
        nargs="+",
        help="root directory(s) with loss*.csv",
    )

    args = parser.parse_args()
    do_plots(args.root_dirs)
    plt.tight_layout()
    plt.show()


if __name__ == "__main__":
    main()