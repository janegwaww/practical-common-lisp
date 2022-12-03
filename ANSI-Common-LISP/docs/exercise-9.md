

# exercise-9

1.  [Define a function that takes&#x2026;](#org6ac9def)
2.  [Define a function that takes&#x2026;](#org5d55857)
3.  [A faraway planet is inhabited&#x2026;](#org7c29a90)
4.  [Define a function that takes 8&#x2026;](#orgb5e1a78)
5.  [Suppose `f` is a function of one&#x2026;](#org34570fb)
6.  [*Horner's method* is a trick for&#x2026;](#orgb20153e)
7.  [How many bits would you estimate&#x2026;](#orgc186095)
8.  [How many distinct types of float does your implementation provide?](#org6f553d6)


<a id="org6ac9def"></a>

## Define a function that takes&#x2026;

1.Define a function that takes a list of reals and returns true iff they are in nondecreasing order.


<a id="org5d55857"></a>

## Define a function that takes&#x2026;

2.Define a function that takes an integer number of cents and returns four values showing how to make that number out of 25-, 10-, 5- and 1-cent pieces, using the smallest total number of coins.


<a id="org7c29a90"></a>

## A faraway planet is inhabited&#x2026;

3.A faraway planet is inhabited by two kinds of beings, wigglies and wobblies. Wigglies and wobblies are equally good at singing. Every year there is a great competition to chooses the ten best singers. Here are the results for the past ten years:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />
</colgroup>
<tbody>
<tr>
<td class="org-left">YEAR</td>
<td class="org-right">1</td>
<td class="org-right">2</td>
<td class="org-right">3</td>
<td class="org-right">4</td>
<td class="org-right">5</td>
<td class="org-right">6</td>
<td class="org-right">7</td>
<td class="org-right">8</td>
<td class="org-right">9</td>
<td class="org-right">10</td>
</tr>


<tr>
<td class="org-left">WIGGLIES</td>
<td class="org-right">6</td>
<td class="org-right">5</td>
<td class="org-right">6</td>
<td class="org-right">4</td>
<td class="org-right">5</td>
<td class="org-right">5</td>
<td class="org-right">4</td>
<td class="org-right">5</td>
<td class="org-right">6</td>
<td class="org-right">5</td>
</tr>


<tr>
<td class="org-left">WOBBLIES</td>
<td class="org-right">4</td>
<td class="org-right">5</td>
<td class="org-right">4</td>
<td class="org-right">6</td>
<td class="org-right">5</td>
<td class="org-right">5</td>
<td class="org-right">6</td>
<td class="org-right">5</td>
<td class="org-right">4</td>
<td class="org-right">5</td>
</tr>
</tbody>
</table>

Write a program to simulate such a contest. Do your results suggest that the committee is, in fact, choosing the ten best singers each year?


<a id="orgb5e1a78"></a>

## Define a function that takes 8&#x2026;

4.Define a function that takes 8 reals representing the endpoints of two segments in 2-space, and returns either `nil` if the segments do not intersect, or two values representing the x- and y-coordinates of the intersection if they do.


<a id="org34570fb"></a>

## Suppose `f` is a function of one&#x2026;

5.Suppose `f` is a function of one (real) argument, and that `min` and `max` are nonzero reals with different signs such that `f` has a root (returns zero) for one argument i such that `min` < i < `max`. Define a function that takes four arguments, `f`, `min`, `max`, and `epsilon`, and returns an approximation of i accurate to within plus or minus `epsilon`.


<a id="orgb20153e"></a>

## *Horner's method* is a trick for&#x2026;

6 *Horner's method* is a trick for evaluating polynomials efficiently. To find `ax^3+bx^2+cx+d` you evaluate `x(x(ax+b)+c)+d`. Define a function that takes one or more arguments—the value of x followed by `n` reals representing the coefficients of an (n - l)th-degree polynomial—and calculates the value of the polynomial by *Horner's method*.


<a id="orgc186095"></a>

## How many bits would you estimate&#x2026;

7.How many bits would you estimate your implementation uses to represent fixnums?


<a id="org6f553d6"></a>

## How many distinct types of float does your implementation provide?
