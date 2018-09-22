# frozen_string_literal: true

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test 'Cannot create course with empty name - exception' do
    assert_raises ActiveRecord::RecordInvalid do
      Course.create!(title: '')
    end
  end

  test 'Cannot create course with empty name - errors' do
    c = Course.create(title: '')
    assert_equal 1, c.errors.count
  end

  test 'Cannot create two courses with the same name - exception' do
    Course.create!(title: 'Awesome')

    assert_raises ActiveRecord::RecordInvalid do
      Course.create!(title: 'awesome')
    end
  end

  test 'Cannot create two courses with the same name - errors' do
    Course.create!(title: 'Awesome')

    c = Course.create(title: 'awesome')
    assert_equal 1, c.errors.count
  end
end
