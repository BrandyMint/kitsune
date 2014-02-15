class Site < ActiveRecord::Base
  before_create :generate_access_token
  has_many :rules, dependent: :destroy

  belongs_to :user
  belongs_to :language

  validates :name, :language, :presence => true
  after_save :generate_cjs

  def generate_cjs
    js_content = Uglifier.new.compile(Renderer.render template: 'layouts/kitsune', locals: { site: self })
    File.open(cjs_file_path, 'w') {|file| file.write(js_content)}
    FileUtils.chmod 0755, cjs_file_path
  end

  def remove_cjs
    if File.exists?(cjs_file_path)
      FileUtils.rm(cjs_file_path)
    end
  end

  def cjs_url
    #"#{Settings.app.asset_host}/cjs/#{access_token}.js"
    "#{Settings.app.asset_host}/sites/#{self.id}/kitsune.js"
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
