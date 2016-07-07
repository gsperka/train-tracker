class Transportation < ActiveRecord::Base
  validates :train_line,  :inclusion => { :in => [ 'El', 'Metra', 'Amtrak'], 
                          :message => "%{value} is not a valid train line" }

  before_save :remove_duplicate

  def self.ordered
  	order(:run_number)
  end

  private

  def remove_duplicate
    grouped = Transportation.all.group_by{|model| [model.train_line, model.route, model.run_number, model.operator_id] }
    grouped.values.each do |duplicates|
      first_one = duplicates.shift 
      duplicates.each{|double| double.destroy}
    end
  end

end
