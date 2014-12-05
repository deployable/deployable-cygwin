module Cygwin
  require 'win32/api'

  module Path
    include Win32

    @cygwin_conv_path =
      API.new( 'cygwin_conv_path', 'PVVI', 'I', 'cygwin1.dll' )
    #CCP_POSIX_TO_WIN_W

    CCP_POSIX_TO_WIN_A  = 0
    CCP_POSIX_TO_WIN_W  = 1
    CCP_WIN_A_TO_POSIX  = 2
    CCP_WIN_W_TO_POSIX  = 3

    CCP_RELATIVE = 4

    def self.call  what, path, buffer_size = 257
      buffer = "\0" * buffer_size
      if @cygwin_conv_path.call( what, path, buffer, buffer_size ) == -1
        raise "cannot convert path name"
      end
      buffer.delete!("\0")
      buffer
    end

    def self.to_cyg path
      call CCP_WIN_W_TO_POSIX, path
    end

    def self.to_cyg_relative path
      call CCP_WIN_W_TO_POSIX+CCP_RELATIVE, path
    end

    def self.to_win path
      call CCP_POSIX_TO_WIN_W, path
    end

    def self.to_win_relative path
      call CCP_POSIX_TO_WIN_W+CCP_RELATIVE, path
    end
  end

end