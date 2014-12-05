require "deployable/cygwin/version"

module Deployable; module Cygwin

  CYGWIN = !!(RbConfig::CONFIG["host_os"] =~ /cygwin/)
  def self.cygwin?
    CYGWIN
  end

end; end
