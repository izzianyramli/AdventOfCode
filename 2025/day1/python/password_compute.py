# Day 1 - Password Computation

file_path = "rotations.txt"

rotate_list = []
direction = []
steps = []


def main():
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
            position = (position - steps[i]) % 100
        elif (d == "R"):
            position = (position + steps[i]) % 100
    
        print(f"Current position={position}")
        if position == 0:
            password = password + 1
    
    print(f"\nPassword = {password}")

if __name__ == "__main__":
    main()
    