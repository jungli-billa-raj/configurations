start = 1
sum = 1
print(sum)

for i in range(200):
    start = start / 2
    sum = sum + start
    print(sum)
    if sum == 2.0:
        print(i)
        break
