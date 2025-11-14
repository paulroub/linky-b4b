def main():
    in_local = False
    in_prod = False

    outlines = []

    with open("admin/config.yml", "r", encoding="utf-8") as f:
        lines = [line.rstrip() for line in f.readlines()]

    for line in lines:
        if "BEGIN PRODUCTION CONFIG" in line:
            in_prod = True
            outlines.append(line)
        elif "END PRODUCTION CONFIG" in line:
            in_prod = False
            outlines.append(line)
        elif "BEGIN LOCAL CONFIG" in line:
            in_local = True
            outlines.append(line)
        elif "END LOCAL CONFIG" in line:
            in_local = False
            outlines.append(line)
        elif in_prod:
            outlines.append(f"# {line}")
        elif in_local:
            if line.startswith("# "):
                outlines.append(line[2:])
            else:
                outlines.append(line)
        else:
            outlines.append(line)

    with open("admin/config.yml", "w", encoding="utf-8") as f:
        f.write("\n".join(outlines))


if __name__ == "__main__":
    main()
