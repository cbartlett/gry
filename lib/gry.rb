require 'fileutils'
require 'tempfile'
require 'yaml'
require 'json'
require 'optparse'
require 'open3'
require 'pathname'

require 'rubocop'
require 'parallel'

require "gry/version"
require 'gry/rubocop_runner'
require 'gry/congress'
require 'gry/law'
require 'gry/pilot_study'
require "gry/option"
require 'gry/cli'
require 'gry/rubocop_adapter'
require 'gry/formatter'

module Gry
  @debug = false
  def self.debug?
    @debug
  end

  def self.debug_mode!
    @debug = true
  end

  @mu_debug_print = Thread::Mutex.new
  def self.debug_log(msg)
    @mu_debug_print.lock

    return unless debug?
    message = msg.is_a?(String) ? msg : msg.inspect
    $stderr.puts message
  ensure
    @mu_debug_print.unlock
  end
end
