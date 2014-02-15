class Site < ActiveRecord::Base
  before_create :generate_access_token
  has_many :rules

  belongs_to :user
  belongs_to :language

  validates :name, :language, :presence => true

  def generate_cjs

    FileUtils.chmod 0755, cjs_file_path
  end

  def remove_cjs
    if File.exists?(cjs_file_path)
      FileUtils.rm(cjs_file_path)
    end
  end


  private

  def cjs_file_path
    Rails.root.join('public').join('cjs').join("#{access_token}.js")
  end

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
