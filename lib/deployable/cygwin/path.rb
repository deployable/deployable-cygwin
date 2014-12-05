require 'ffi'

module Deployable; module Cygwin; module Path

  extend FFI::Library

  # Cygwin api `cygwin_conv_path`
  ffi_lib 'cygwin1.dll'
  ffi_convention :stdcall
  attach_function :cygwin_conv_path, :cygwin_conv_path,[ :uint, :pointer, :pointer, :uint ], :int

  # cygwin_conv_path_t ENUM from ./cygwin/include/sys/cygwin.h
  POSIX_TO_WIN_A  = 0
  POSIX_TO_WIN_W  = 1
  WIN_A_TO_POSIX  = 2
  WIN_W_TO_POSIX  = 3
  RELATIVE = 4

  # Convert paths via Cygwin api `cygwin_conv_path`
  # https://www.cygwin.com/cygwin-api/func-cygwin-conv-path.html
  def self.conv_call  type, path
    # First get the required size of the buffer
    buffer_size = Cygwin::Path.cygwin_conv_path( type, path, nil, 0 )
    raise "Cannot get buffer size for path" if buffer_size < 0
    buffer = "\0" * buffer_size

    # Then the actual call
    res = Cygwin::Path.cygwin_conv_path( type, path, buffer, buffer_size )
    raise "Cannot convert path name" if res != 0

    # Clean it up
    buffer.delete!("\0")
    buffer
  end

  # Windows to Cygwin
  # C:\tmp /cygdrive/c/tmp
  def self.to_cyg path
    conv_call WIN_A_TO_POSIX, path
  end

  # Windows to Cygwin relative
  # blag /cygdrive/c/Users/user/blag
  def self.to_cyg_relative path
    conv_call WIN_A_TO_POSIX+RELATIVE, path
  end

  # Cygwin to Windows
  # /tmp C:\cygwin\tmp
  def self.to_win path
    conv_call POSIX_TO_WIN_A, path
  end

  # Cygwin to Windows relative
  # blag c:\cygwin\home\user\blag
  def self.to_win_relative path
    conv_call POSIX_TO_WIN_A+RELATIVE, path
  end

end; end; end