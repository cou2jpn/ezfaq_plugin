class AddFaqsFaqdetails < ActiveRecord::Migration
  def self.up
    add_column :faqs, :faqdetails, :text
    add_column :faq_versions, :faqdetails, :text
  end

  def self.down
    remove_column :faqs, :faqdetais
    remove_column :faq_versions, :faqdetais
  end
end

