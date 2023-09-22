import re
from datetime import datetime, timedelta
import argparse

def parse_times_from_log(log_content):
    pattern = r"Date: (\d{4}-\d{2}-\d{2})\nTime: (\d{2}:\d{2}:\d{2})"
    matches = re.findall(pattern, log_content)
    times = [datetime.strptime(f"{date} {time}", "%Y-%m-%d %H:%M:%S") for date, time in matches]
    return times

def compute_average_time_gap(times):
    gaps = [(times[i+1] - times[i]) for i in range(len(times)-1)]
    print(gaps)
    # remove the biggest gap and smallest gap
    gaps.sort()
    gaps = gaps[1:-1]
    average_gap = sum(gaps, timedelta()) / len(gaps)
    return average_gap

def main():
    parser = argparse.ArgumentParser(description="Compute average time gap between cases from log file.")
    parser.add_argument("filename", type=str, help="Path to the log file")

    args = parser.parse_args()

    with open(args.filename, "r") as file:
        log_content = file.read()

    times = parse_times_from_log(log_content)
    print(times)
    print("times count: ", len(times))

    if len(times) < 2:
        print("Not enough time entries to compute an average gap.")
    else:
        average_gap = compute_average_time_gap(times)
        print(f"Average time gap between cases: {average_gap}")

if __name__ == "__main__":
    main()