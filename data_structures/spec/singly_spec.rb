require 'spec_helper'
require_relative '../singly_linked_list.rb'

describe SinglyLinkedList do
  before do
    @language = SinglyLinkedList.new('java')
  end

  describe 'prepend' do
    it 'prepend a node to the beginning of the list' do
      expect(@language.prepend('ruby').head.value).to eq 'ruby'
      expect(@language.prepend('python').head.value).to eq 'python'
    end
  end

  describe 'last' do
    it 'returns the last node of the list' do
      expect(@language.last.value).to eq 'java'
      expect(@language.prepend('ruby').last.value).to eq 'java'
    end
  end

  describe 'insertAfter' do
    it 'insers the new_node after the node in the list' do
      @language.prepend('ruby')
      expect(@language.insertAfter(@language.head, 'python').head.next.value).to eq 'python'
      expect(@language.insertAfter(@language.last, 'python').last.value).to eq 'python'
    end
  end

  describe 'append' do
    it 'append the new_node to the end of the list' do
      expect(@language.append('python').last.value).to eq 'python'
    end
  end

  describe 'remove' do
    it 'removes and return the first node' do
      expect(@language.remove).to eq @language.head
    end
  end

  describe 'length' do
    it 'returns the length of the list' do
      expect(@language.length).to eq 1
      @language.prepend('ruby')
      expect(@language.length).to eq 2
    end
  end

  describe 'find' do
    it 'returns the node which contains the value' do
      @language.prepend('ruby').prepend('python')
      expect(@language.find('java')).to eq @language.last
      expect(@language.find('bla')).to eq nil
    end
  end

  describe 'reverse' do
    it 'returns the node in reverse order' do
      @language.prepend('ruby').prepend('python')
      new_list = SinglyLinkedList.new('python').prepend('ruby').prepend('java')
      expected = new_list.to_array
      reversed = @language.reverse
      reversed_array = reversed.to_array
      expect(reversed_array).to eq expected
    end
    it 'does not reverse the supplied list' do
      original_list = SinglyLinkedList.new(1)
      original_list.append 2
      original_list.append 3
      original_list.reverse
      expect(original_list.to_array).to eq [1,2,3]
    end
  end

  describe 'reverse!' do
    it 'returns the node in reverse order' do
      @language.prepend('ruby').prepend('python')
      new_list = SinglyLinkedList.new('python').prepend('ruby').prepend('java')
      expected = new_list.to_array
      reversed = @language.reverse!
      reversed_array = reversed.to_array
      expect(reversed_array).to eq expected
    end
    it 'reverse the supplied list' do
      original_list = SinglyLinkedList.new(1)
      original_list.append 2
      original_list.append 3
      original_list.reverse!
      expect(original_list.to_array).to eq [3,2,1]
    end
  end

  describe 'to_s' do
    it "returns a string which contains all of the nodes' values" do
      @language.prepend('ruby').prepend('python')
      expect(@language.to_s).to eq "python, ruby, java"
    end
  end
end
