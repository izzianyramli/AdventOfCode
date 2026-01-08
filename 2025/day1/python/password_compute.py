# Day 1 - Password Computation
import argparse

rotate_list = []
direction = []
steps = []


def wrap_0_99(value):
    while (value >= 100):
        value = value - 100
    while value < 0:
        value = value + 100
    return value


def main(file_path):
    print("Password Computation")

    print("Reading txt file")
    with open(file_path, 'r') as f:
        for line in f:
            rotate_list.append(line.strip())

    for rotate in rotate_list:
        # print(f"{rotate}")
        direction.append(rotate[0])
        steps.append(int(rotate[1:]))
    
    # print(direction)
    # print(steps)

    position = 50
    password = 0

    for i, d in enumerate(direction):
        if (d == "L"):
            position = (position - steps[i])
        elif (d == "R"):
            position = (position + steps[i])
        
        position = wrap_0_99(position)
    
        print(f"Current position={position}")
        if position == 0:
            password = password + 1
    
    print(f"\nPassword = {password}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Advent of Code - Day 1")
    
    parser.add_argument("file_path", type=str, default="rotations.txt", help="Path to the rotation list txt file")
    args = parser.parse_args()
    
    main(args.file_path)
    