require "csv"

puts "1(新規でメモを作成する) 2(既存のメモを編集する)"

memo_type = gets.to_i

while memo_type != 1 && memo_type !=2
  puts "1か2を選択してください"
  memo_type = gets.to_i
end

case memo_type
  when 1
    puts "拡張子を除いたファイルを入力してください"
    new_csv = gets.chomp
    CSV.open( new_csv + ".csv", "w") do |csv|
      puts "メモしたい内容を入力してください"
      puts "完了したらContrl + Dをお願いします"
      while row = gets do
        csv << [row.chomp]
      end
    end
  when 2
    puts "編集するファイルを拡張子を除いて入力してください"
    edit_csv = gets.chomp
    puts ("現在の内容以下のとおりです")
    CSV.open( edit_csv + ".csv") do |csv|
      csv.each do |row|
        p row
      end
    end
    CSV.open( edit_csv + ".csv", "a") do |csv|
      puts "追加したい内容を入力してください"
      puts "完了したらContrl + Dをお願いします"
      while row = gets do
        csv << [row.chomp]
      end
    end
end
