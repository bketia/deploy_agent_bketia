warning = 75 
failure = 50
students = {"Anny": 80, "Ben": 60, "Joel": 40}
for name, att in students.items():
    if att < failure:
        status = "FAIL"
    elif att < warning:
        status = "WARN"
    else:
        status = "OK"
    print(f"{name}: {att}% - {status}")
with open("reports/reports.log", "w") as f:
    for name, att in students.items():
        f.write(f"{name}: {att}%\n")

print("Report saved in reports/reports.log")

