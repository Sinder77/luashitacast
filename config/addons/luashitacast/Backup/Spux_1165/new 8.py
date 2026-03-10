tembed <drac2>

minimum_total = 70
dump_stat = 10
high_stat = 16
dice = "4d6kh3"
rolls = []

#setup the output
out = [
    f'-title "Rolling for Stats: {ctx.author.name}#{ctx.author.discriminator}"',
    f'-f "Rules|Minimum total {minimum_total}\nAt least one high stat ({high_stat}+)\nAt least one dump stat ({dump_stat}-)"',
    f'-thumb "https://cdn.discordapp.com/attachments/771338918452002818/912770878264180746/1.png"',
    f'-color <color>',
    f'-footer "!help statroll"'
]

# Channel locking
if ctx.channel.id != 1154723536020193300 # character-log and alias-testing
    out.append(f'-title "Incorrect channel"')
    out.append(f'-desc "This command can only be executed in #character-log."')
    return ' '.join(out)

# Rolling dump stat
while True:
    low_roll = vroll(dice)
    if low_roll.total <= dump_stat:
        rolls.append(low_roll)
        break

# Rolling remaining stats
while True:
    high_rolls = [vroll(dice),vroll(dice),vroll(dice),vroll(dice),vroll(dice)]
    
    check_total = False
    check_highest = False
    
    total = rolls[0].total
    for r in high_rolls:
        total += r.total
        if r.total >= high_stat:
            check_highest = True
    
    if total >= minimum_total:
        check_total = True

    if check_total and check_highest:
        rolls.extend(high_rolls)
        break

# Rolls text
roll_text = "Rolls|"
roll_total = 0

for r in rolls:
    roll_text += f'{r.result}\n'
    roll_total += r.total

roll_text += f'Total: {roll_total}'

out.append(f'-f "{roll_text}"')
return ' '.join(out)

</drac2>