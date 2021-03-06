# coding: utf-8

require 'spec_helper'

RSpec.describe TTY::Spinner, 'hide_cursor' do
  let(:output) { StringIO.new('', 'w+') }

  it "hides cursor" do
    spinner = TTY::Spinner.new(output: output, hide_cursor: true)
    4.times { spinner.spin }
    spinner.stop
    output.rewind
    expect(output.read).to eq([
      "\e[?25l\e[1G|",
      "\e[1G/",
      "\e[1G-",
      "\e[1G\\",
      "\e[?25h"
    ].join)
  end
end
