module EzFaqNotifiablePatch
  def self.included(base) # :nodoc:
    @is_wrap = false
    base.extend NotifiableMethods
    base.class_eval do
      unloadable
      class << self
        if !@is_wrap
          alias_method_chain :all, :ezfaq_updates
          @is_wrap = true
        end
      end
    end
  end
end

module NotifiableMethods
  def all_with_ezfaq_updates
    notifications = all_without_ezfaq_updates
    notifications << Redmine::Notifiable.new('faq_new')
    notifications << Redmine::Notifiable.new('faq_updated')
    notifications
  end
end


Redmine::Notifiable.send(:include, EzFaqNotifiablePatch)
