print '{"version":1}'
print '['

output = ""
old_print = print
print = (str) ->
    output = output .. str

class Base
    colour_normal: "#4C9A9A"
    colour_attn: "#ae144b"
    colour_inactive: "#666666"

    print_entry: (last, fulltext, shorttext, colour) =>
        print '{'
        print '"full_text": "' .. fulltext .. '"'
        if shorttext
            print ', "short_text": "' .. shorttext .. '"'

        colour = colour or @colour_normal

        print ', "color": "' .. colour .. '"'

        print '}'
        unless last then print ','

    new: =>
        @num_iters = 0

    date: =>
        @\print_entry true, os.date("%c"), os.date("%T")

    wireless: =>
        fh = io.popen 'iwconfig wlan0'
        for line in fh\lines!
            if string.match line, 'Quality'
                quality = string.match line, '%d+'
                quality += 0

                r = nil
                c = @colour_normal

                if quality < 20
                    r = 'poor'
                    c = @colour_attn
                else if quality < 46
                    r = 'ok'
                else if quality < 60
                    r = 'good'
                else
                    r = 'excellent'

                @\print_entry false, "Wifi strength: " .. r, r, c

        fh\close!

    ip: =>
        fh = io.popen 'ifconfig'

        for line in fh\lines!
            if string.match line, 'inet addr'
                address = string.match line, '%d+\.%d+\.%d+\.%d+'
                unless address == '127.0.0.1'
                    @\print_entry false, "IP: " .. address, address

        fh\close!

    cpu: =>
        fh = io.popen('mpstat 1 2 | tail -n1 |  awk \'$11 ~ /[0-9.]+/ { print 100 - $11"%" }\'')
        local total

        for line in fh\lines!
            total = line

        @\print_entry false, total, total
        fh\close!

base = Base!

while true
    print '['
    base\cpu!
    base\wireless!
    base\ip!
    base\date!
    print '],'

    old_print output
    output = ""
