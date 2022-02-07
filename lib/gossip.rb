
require 'csv'

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    #filepath = "../db/gossip.csv" #click droit sur le fichier csv pour prendre le relative path

    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end


  def self.all
    all_gossips = []
      CSV.read("./db/gossip.csv").each do |csv_line|
        all_gossips << Gossip.new(csv_line[0], csv_line[1])
      end
    return all_gossips
  end

  def self.find(id)
    selected_gossip = Gossip.all[id.to_i - 1]
    return selected_gossip
  end

  def update
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end
end
