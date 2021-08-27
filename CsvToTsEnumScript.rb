def CsvToTsEnum(csv, linesToSkip = 0, forceString = false)
  name = File.basename(csv, ".*")
  open("#{name}.ts", 'w') do |f|
    f.puts "export enum #{name} {"
    open(csv).each do |line|
      if $. > linesToSkip.to_i
        line.encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
        lineValues = line.split(';', -1)
        f.puts "#{FormatKey(lineValues[1])} = #{FormatValue(lineValues[2], forceString)},"
      end
    end
    f.puts "}"
  end
end

def FormatKey(key) 
  cleaned = key
  .downcase
  .gsub(/[^0-9A-Za-z]/, '-')
  .split('-')
  .map.with_index{|x,i| i >= 0 ? x.capitalize : x}.join

  return cleaned
end

def FormatValue(value, isString)
  value = value.gsub(/\n/, "")
  if !isString && /\A\d+\z/.match(value)
    return value.to_i
  else
    return "\"#{value}\""
  end
end

CsvToTsEnum *ARGV