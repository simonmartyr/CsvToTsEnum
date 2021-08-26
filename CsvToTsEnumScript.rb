def CsvToTsEnum(csv, linesToSkip) 
  puts "#{csv}:"
  puts "#{linesToSkip}"
  name = File.basename(csv, ".*")
  open("#{name}.ts", 'w') do |f|
    f.puts "export enum #{name} {"
    open(csv).each do |line|
      if $. > linesToSkip.to_i
        lineValues = line.split(';', -1)
        puts lineValues
        puts lineValues.length
        FormatKey(lineValues[1])
        f.puts "#{lineValues[1]} = #{FormatValue(lineValues[2])},"
      end
    end
    f.puts "}"
  end
end

def FormatKey(key) 
  key.gsub!(/[^0-9A-Za-z]/, '')
end

def FormatValue(value)
  value = value.gsub(/\n/, "")
  if /\A\d+\z/.match(value)
    return value.to_i
  else
    return "\"#{value}\""
  end
end

CsvToTsEnum *ARGV