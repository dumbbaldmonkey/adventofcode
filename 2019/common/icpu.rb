class ICPU
    ADD = 1
    MULTIPLY = 2
    ERROR = 99

    def initialize(intcodes)
        @intcodes = intcodes
        @index = 0
        @code_99 = false
    end


    def process
        until @code_99
            case @intcodes[@index]
            when ADD
                add()
            when MULTIPLY
                multiply()
            else
                @code_99 = true     
            end
        end
        return @intcodes[0]
    end

    private
    def add
        @intcodes[@intcodes[@index+3]] = @intcodes[@intcodes[@index+1]] + @intcodes[@intcodes[@index+2]]
        @index += 4
        nil
    end

    def multiply
        @intcodes[@intcodes[@index+3]] = @intcodes[@intcodes[@index+1]] * @intcodes[@intcodes[@index+2]]
        @index += 4
        nil
    end
end