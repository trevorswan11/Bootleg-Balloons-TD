with open('rounds_template.json', 'w') as f:
    f.write('{\n\t"rounds": {')

    for count in range(1, 101):
        f.write(f'\n\t\t"round_{count}": [\n\t\t\t0\n\t\t]')
        if count < 100:
            f.write(',')

    f.write('\n\t}\n}')