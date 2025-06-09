# frozen_string_literal: true

{
  ru: {
    i18n: {
      plural: {
        rule: lambda { |n|
          if n % 10 == 1 && n % 100 != 11
            :one
          elsif (2..4).cover?(n % 10) && !(12..14).cover?(n % 100)
            :few
          else
            (n % 10).zero? || (5..9).cover?(n % 10) || (11..14).cover?(n % 100) ? :many : :other
          end
        }
      }
    }
  }
}
