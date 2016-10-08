class ResumeSearchQuery < ActiveRecord::Base

  def self.create_from_hash(h)
    return if h.blank?
    new_record = self.new do |r|
      r.data = h
      r.data_hash = r.data.hash
    end

    if old_record = self.where(data_hash: new_record.data.hash).first
      old_record.increment!(:count)
      return old_record
    else
      new_record.save!
      return new_record
    end
  end
end
