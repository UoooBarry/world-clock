module TimeHelper
    MELBOURNE_OFFSET = 10
    CONVERT_OFFSET_TO_DAT = 3600
    def get_time(offset, check)
        offset = offset * CONVERT_OFFSET_TO_DAT #make offset to hours
        @time = Time.now.getutc + offset
        if check == "false"
            result = @time.to_time.strftime('%l:%M %p')
        else check == "true"
            result = @time.to_time.strftime("%H:%M")
        end

        return result
    end

    def get_offset_of_melb(offset)
        unless offset == 10
            if offset < 10
                return "#{offset - MELBOURNE_OFFSET}h"
            else
                return "+ #{offset - MELBOURNE_OFFSET}h"
            end
        else 
            return nil
        end
    end

    def get_date_different(offset)
        offset = offset * CONVERT_OFFSET_TO_DAT  #make offset to hours
        diff = offset - (MELBOURNE_OFFSET * CONVERT_OFFSET_TO_DAT)  #get the diffrence of 2 cities
        melbourne_time = get_time(MELBOURNE_OFFSET, false)#get melbourne time

        if Time.parse(melbourne_time) + diff <= Time.parse("00:00:00") #convert to melbourne time zone
            return "yesterday"
        elsif Time.parse(melbourne_time) + diff > Time.parse("23:59:59")
            return "tomorrow"
        else
            return "today"
        end
    end

    def display(name)
        str = name.split("/")
        return str[1]
    end

    def get_time_mode(time)
       if time >= Time.parse('9:00 AM') && time <= Time.parse('5:59 PM')
            return "bussiness" 
       elsif time >= Time.parse('6:00 PM') && time <= Time.parse('7:59 PM')
            return "bussiness over"
       elsif time >= Time.parse('8:00 AM') && time <= Time.parse('8:59 AM') || time >= Time.parse('8:00 PM') && time <= Time.parse('10:59 PM') 
            return "personal"
       elsif time >= Time.parse('11:00 PM') && time <= Time.parse('7:59 AM')
            return "sleeping"
       end
    end

end
