defmodule RationalNumbers do
  import Kernel, except: [abs: 1]

  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}),
    do: {a1 * b2 + b1 * a2, b1 * b2} |> reduce()

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}),
    do: {a1 * b2 - a2 * b1, b1 * b2} |> reduce()

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}), do: {a1 * a2, b1 * b2} |> reduce()

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}),
    do: {a1 * b2, b1 * a2} |> reduce()

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}), do: {Kernel.abs(a), Kernel.abs(b)} |> reduce()

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a, b}, n) when n >= 0, do: {a ** n, b ** n} |> reduce()

  def pow_rational({a, b}, n) when n < 0,
    do: {b ** Kernel.abs(n), a ** Kernel.abs(n)} |> reduce()

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}), do: :math.pow(x ** a, 1 / b)

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a, _b}) when a == 0, do: {0, 1}
  def reduce({a, b}) when b < 0, do: reduce({-1 * a, -1 * b})

  def reduce({a, b}) do
    gcd = Integer.gcd(a, b)

    {div(a, gcd), div(b, gcd)}
  end
end
