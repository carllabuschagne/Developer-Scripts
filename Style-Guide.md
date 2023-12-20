<h1 id="c-at-google-style-guide">C# at Google Style Guide</h1>

<p>This style guide is for C# code developed internally at Google, and is the
default style for C# code at Google. It makes stylistic choices that conform to
other languages at Google, such as Google C++ style and Google Java style.</p>

<h2 id="formatting-guidelines">Formatting guidelines</h2>

<h3 id="naming-rules">Naming rules</h3>

<p>Naming rules follow
<a href="https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/naming-guidelines">Microsoft’s C# naming guidelines</a>.
Where Microsoft’s naming guidelines are unspecified (e.g. private and local
variables), rules are taken from the
<a href="https://github.com/dotnet/runtime/blob/master/docs/coding-guidelines/coding-style.md">CoreFX C# coding guidelines</a></p>

<p>Rule summary:</p>

<h4 id="code">Code</h4>

<ul>
  <li>Names of classes, methods, enumerations, public fields, public properties,
namespaces: <code class="language-plaintext highlighter-rouge">PascalCase</code>.</li>
  <li>Names of local variables, parameters: <code class="language-plaintext highlighter-rouge">camelCase</code>.</li>
  <li>Names of private, protected, internal and protected internal fields and
properties: <code class="language-plaintext highlighter-rouge">_camelCase</code>.</li>
  <li>Naming convention is unaffected by modifiers such as const, static,
readonly, etc.</li>
  <li>For casing, a “word” is anything written without internal spaces, including
acronyms. For example, <code class="language-plaintext highlighter-rouge">MyRpc</code> instead of <del><code class="language-plaintext highlighter-rouge">MyRPC</code></del>.</li>
  <li>Names of interfaces start with <code class="language-plaintext highlighter-rouge">I</code>, e.g. <code class="language-plaintext highlighter-rouge">IInterface</code>.</li>
</ul>

<h4 id="files">Files</h4>

<ul>
  <li>Filenames and directory names are <code class="language-plaintext highlighter-rouge">PascalCase</code>, e.g. <code class="language-plaintext highlighter-rouge">MyFile.cs</code>.</li>
  <li>Where possible the file name should be the same as the name of the main
class in the file, e.g. <code class="language-plaintext highlighter-rouge">MyClass.cs</code>.</li>
  <li>In general, prefer one core class per file.</li>
</ul>

<h3 id="organization">Organization</h3>

<ul>
  <li>Modifiers occur in the following order: <code class="language-plaintext highlighter-rouge">public protected internal private
new abstract virtual override sealed static readonly extern unsafe volatile
async</code>.</li>
  <li>Namespace <code class="language-plaintext highlighter-rouge">using</code> declarations go at the top, before any namespaces. <code class="language-plaintext highlighter-rouge">using</code>
import order is alphabetical, apart from <code class="language-plaintext highlighter-rouge">System</code> imports which always go
first.</li>
  <li>Class member ordering:
    <ul>
      <li>Group class members in the following order:
        <ul>
          <li>Nested classes, enums, delegates and events.</li>
          <li>Static, const and readonly fields.</li>
          <li>Fields and properties.</li>
          <li>Constructors and finalizers.</li>
          <li>Methods.</li>
        </ul>
      </li>
      <li>Within each group, elements should be in the following order:
        <ul>
          <li>Public.</li>
          <li>Internal.</li>
          <li>Protected internal.</li>
          <li>Protected.</li>
          <li>Private.</li>
        </ul>
      </li>
      <li>Where possible, group interface implementations together.</li>
    </ul>
  </li>
</ul>

<h3 id="whitespace-rules">Whitespace rules</h3>

<p>Developed from Google Java style.</p>

<ul>
  <li>A maximum of one statement per line.</li>
  <li>A maximum of one assignment per statement.</li>
  <li>Indentation of 2 spaces, no tabs.</li>
  <li>Column limit: 100.</li>
  <li>No line break before opening brace.</li>
  <li>No line break between closing brace and <code class="language-plaintext highlighter-rouge">else</code>.</li>
  <li>Braces used even when optional.</li>
  <li>Space after <code class="language-plaintext highlighter-rouge">if</code>/<code class="language-plaintext highlighter-rouge">for</code>/<code class="language-plaintext highlighter-rouge">while</code> etc., and after commas.</li>
  <li>No space after an opening parenthesis or before a closing parenthesis.</li>
  <li>No space between a unary operator and its operand. One space between the
operator and each operand of all other operators.</li>
  <li>Line wrapping developed from Google C++ style guidelines, with minor
modifications for compatibility with Microsoft’s C# formatting tools:
    <ul>
      <li>In general, line continuations are indented 4 spaces.</li>
      <li>Line breaks with braces (e.g. list initializers, lambdas, object
initializers, etc) do not count as continuations.</li>
      <li>For function definitions and calls, if the arguments do not all fit on
one line they should be broken up onto multiple lines, with each
subsequent line aligned with the first argument. If there is not enough
room for this, arguments may instead be placed on subsequent lines with
a four space indent. The code example below illustrates this.</li>
    </ul>
  </li>
</ul>

<h3 id="example">Example</h3>

<div class="language-c# highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="k">using</span> <span class="nn">System</span><span class="p">;</span>                                       <span class="c1">// `using` goes at the top, outside the</span>
                                                    <span class="c1">// namespace.</span>

<span class="k">namespace</span> <span class="nn">MyNamespace</span> <span class="p">{</span>                             <span class="c1">// Namespaces are PascalCase.</span>
                                                    <span class="c1">// Indent after namespace.</span>
  <span class="k">public</span> <span class="k">interface</span> <span class="nc">IMyInterface</span> <span class="p">{</span>                   <span class="c1">// Interfaces start with 'I'</span>
    <span class="k">public</span> <span class="kt">int</span> <span class="nf">Calculate</span><span class="p">(</span><span class="kt">float</span> <span class="k">value</span><span class="p">,</span> <span class="kt">float</span> <span class="n">exp</span><span class="p">);</span>   <span class="c1">// Methods are PascalCase</span>
                                                    <span class="c1">// ...and space after comma.</span>
  <span class="p">}</span>

  <span class="k">public</span> <span class="k">enum</span> <span class="n">MyEnum</span> <span class="p">{</span>                              <span class="c1">// Enumerations are PascalCase.</span>
    <span class="n">Yes</span><span class="p">,</span>                                            <span class="c1">// Enumerators are PascalCase.</span>
    <span class="n">No</span><span class="p">,</span>
  <span class="p">}</span>

  <span class="k">public</span> <span class="k">class</span> <span class="nc">MyClass</span> <span class="p">{</span>                            <span class="c1">// Classes are PascalCase.</span>
    <span class="k">public</span> <span class="kt">int</span> <span class="n">Foo</span> <span class="p">=</span> <span class="m">0</span><span class="p">;</span>                             <span class="c1">// Public member variables are</span>
                                                    <span class="c1">// PascalCase.</span>
    <span class="k">public</span> <span class="kt">bool</span> <span class="n">NoCounting</span> <span class="p">=</span> <span class="k">false</span><span class="p">;</span>                 <span class="c1">// Field initializers are encouraged.</span>
    <span class="k">private</span> <span class="k">class</span> <span class="nc">Results</span> <span class="p">{</span>
      <span class="k">public</span> <span class="kt">int</span> <span class="n">NumNegativeResults</span> <span class="p">=</span> <span class="m">0</span><span class="p">;</span>
      <span class="k">public</span> <span class="kt">int</span> <span class="n">NumPositiveResults</span> <span class="p">=</span> <span class="m">0</span><span class="p">;</span>
    <span class="p">}</span>
    <span class="k">private</span> <span class="n">Results</span> <span class="n">_results</span><span class="p">;</span>                       <span class="c1">// Private member variables are</span>
                                                    <span class="c1">// _camelCase.</span>
    <span class="k">public</span> <span class="k">static</span> <span class="kt">int</span> <span class="n">NumTimesCalled</span> <span class="p">=</span> <span class="m">0</span><span class="p">;</span>
    <span class="k">private</span> <span class="k">const</span> <span class="kt">int</span> <span class="n">_bar</span> <span class="p">=</span> <span class="m">100</span><span class="p">;</span>                   <span class="c1">// const does not affect naming</span>
                                                    <span class="c1">// convention.</span>
    <span class="k">private</span> <span class="kt">int</span><span class="p">[]</span> <span class="n">_someTable</span> <span class="p">=</span> <span class="p">{</span>                    <span class="c1">// Container initializers use a 2</span>
      <span class="m">2</span><span class="p">,</span> <span class="m">3</span><span class="p">,</span> <span class="m">4</span><span class="p">,</span>                                      <span class="c1">// space indent.</span>
    <span class="p">}</span>

    <span class="k">public</span> <span class="nf">MyClass</span><span class="p">()</span> <span class="p">{</span>
      <span class="n">_results</span> <span class="p">=</span> <span class="k">new</span> <span class="n">Results</span> <span class="p">{</span>
        <span class="n">NumNegativeResults</span> <span class="p">=</span> <span class="m">1</span><span class="p">,</span>                     <span class="c1">// Object initializers use a 2 space</span>
        <span class="n">NumPositiveResults</span> <span class="p">=</span> <span class="m">1</span><span class="p">,</span>                     <span class="c1">// indent.</span>
      <span class="p">};</span>
    <span class="p">}</span>

    <span class="k">public</span> <span class="kt">int</span> <span class="nf">CalculateValue</span><span class="p">(</span><span class="kt">int</span> <span class="n">mulNumber</span><span class="p">)</span> <span class="p">{</span>      <span class="c1">// No line break before opening brace.</span>
      <span class="kt">var</span> <span class="n">resultValue</span> <span class="p">=</span> <span class="n">Foo</span> <span class="p">*</span> <span class="n">mulNumber</span><span class="p">;</span>            <span class="c1">// Local variables are camelCase.</span>
      <span class="n">NumTimesCalled</span><span class="p">++;</span>
      <span class="n">Foo</span> <span class="p">+=</span> <span class="n">_bar</span><span class="p">;</span>

      <span class="k">if</span> <span class="p">(!</span><span class="n">NoCounting</span><span class="p">)</span> <span class="p">{</span>                            <span class="c1">// No space after unary operator and</span>
                                                    <span class="c1">// space after 'if'.</span>
        <span class="k">if</span> <span class="p">(</span><span class="n">resultValue</span> <span class="p">&lt;</span> <span class="m">0</span><span class="p">)</span> <span class="p">{</span>                      <span class="c1">// Braces used even when optional and</span>
                                                    <span class="c1">// spaces around comparison operator.</span>
          <span class="n">_results</span><span class="p">.</span><span class="n">NumNegativeResults</span><span class="p">++;</span>
        <span class="p">}</span> <span class="k">else</span> <span class="k">if</span> <span class="p">(</span><span class="n">resultValue</span> <span class="p">&gt;</span> <span class="m">0</span><span class="p">)</span> <span class="p">{</span>               <span class="c1">// No newline between brace and else.</span>
          <span class="n">_results</span><span class="p">.</span><span class="n">NumPositiveResults</span><span class="p">++;</span>
        <span class="p">}</span>
      <span class="p">}</span>

      <span class="k">return</span> <span class="n">resultValue</span><span class="p">;</span>
    <span class="p">}</span>

    <span class="k">public</span> <span class="k">void</span> <span class="nf">ExpressionBodies</span><span class="p">()</span> <span class="p">{</span>
      <span class="c1">// For simple lambdas, fit on one line if possible, no brackets or braces required.</span>
      <span class="n">Func</span><span class="p">&lt;</span><span class="kt">int</span><span class="p">,</span> <span class="kt">int</span><span class="p">&gt;</span> <span class="n">increment</span> <span class="p">=</span> <span class="n">x</span> <span class="p">=&gt;</span> <span class="n">x</span> <span class="p">+</span> <span class="m">1</span><span class="p">;</span>

      <span class="c1">// Closing brace aligns with first character on line that includes the opening brace.</span>
      <span class="n">Func</span><span class="p">&lt;</span><span class="kt">int</span><span class="p">,</span> <span class="kt">int</span><span class="p">,</span> <span class="kt">long</span><span class="p">&gt;</span> <span class="n">difference1</span> <span class="p">=</span> <span class="p">(</span><span class="n">x</span><span class="p">,</span> <span class="n">y</span><span class="p">)</span> <span class="p">=&gt;</span> <span class="p">{</span>
        <span class="kt">long</span> <span class="n">diff</span> <span class="p">=</span> <span class="p">(</span><span class="kt">long</span><span class="p">)</span><span class="n">x</span> <span class="p">-</span> <span class="n">y</span><span class="p">;</span>
        <span class="k">return</span> <span class="n">diff</span> <span class="p">&gt;=</span> <span class="m">0</span> <span class="p">?</span> <span class="n">diff</span> <span class="p">:</span> <span class="p">-</span><span class="n">diff</span><span class="p">;</span>
      <span class="p">};</span>

      <span class="c1">// If defining after a continuation line break, indent the whole body.</span>
      <span class="n">Func</span><span class="p">&lt;</span><span class="kt">int</span><span class="p">,</span> <span class="kt">int</span><span class="p">,</span> <span class="kt">long</span><span class="p">&gt;</span> <span class="n">difference2</span> <span class="p">=</span>
          <span class="p">(</span><span class="n">x</span><span class="p">,</span> <span class="n">y</span><span class="p">)</span> <span class="p">=&gt;</span> <span class="p">{</span>
            <span class="kt">long</span> <span class="n">diff</span> <span class="p">=</span> <span class="p">(</span><span class="kt">long</span><span class="p">)</span><span class="n">x</span> <span class="p">-</span> <span class="n">y</span><span class="p">;</span>
            <span class="k">return</span> <span class="n">diff</span> <span class="p">&gt;=</span> <span class="m">0</span> <span class="p">?</span> <span class="n">diff</span> <span class="p">:</span> <span class="p">-</span><span class="n">diff</span><span class="p">;</span>
          <span class="p">};</span>

      <span class="c1">// Inline lambda arguments also follow these rules. Prefer a leading newline before</span>
      <span class="c1">// groups of arguments if they include lambdas.</span>
      <span class="nf">CallWithDelegate</span><span class="p">(</span>
          <span class="p">(</span><span class="n">x</span><span class="p">,</span> <span class="n">y</span><span class="p">)</span> <span class="p">=&gt;</span> <span class="p">{</span>
            <span class="kt">long</span> <span class="n">diff</span> <span class="p">=</span> <span class="p">(</span><span class="kt">long</span><span class="p">)</span><span class="n">x</span> <span class="p">-</span> <span class="n">y</span><span class="p">;</span>
            <span class="k">return</span> <span class="n">diff</span> <span class="p">&gt;=</span> <span class="m">0</span> <span class="p">?</span> <span class="n">diff</span> <span class="p">:</span> <span class="p">-</span><span class="n">diff</span><span class="p">;</span>
          <span class="p">});</span>
    <span class="p">}</span>

    <span class="k">void</span> <span class="nf">DoNothing</span><span class="p">()</span> <span class="p">{}</span>                             <span class="c1">// Empty blocks may be concise.</span>

    <span class="c1">// If possible, wrap arguments by aligning newlines with the first argument.</span>
    <span class="k">void</span> <span class="nf">AVeryLongFunctionNameThatCausesLineWrappingProblems</span><span class="p">(</span><span class="kt">int</span> <span class="n">longArgumentName</span><span class="p">,</span>
                                                             <span class="kt">int</span> <span class="n">p1</span><span class="p">,</span> <span class="kt">int</span> <span class="n">p2</span><span class="p">)</span> <span class="p">{}</span>

    <span class="c1">// If aligning argument lines with the first argument doesn't fit, or is difficult to</span>
    <span class="c1">// read, wrap all arguments on new lines with a 4 space indent.</span>
    <span class="k">void</span> <span class="nf">AnotherLongFunctionNameThatCausesLineWrappingProblems</span><span class="p">(</span>
        <span class="kt">int</span> <span class="n">longArgumentName</span><span class="p">,</span> <span class="kt">int</span> <span class="n">longArgumentName2</span><span class="p">,</span> <span class="kt">int</span> <span class="n">longArgumentName3</span><span class="p">)</span> <span class="p">{}</span>

    <span class="k">void</span> <span class="nf">CallingLongFunctionName</span><span class="p">()</span> <span class="p">{</span>
      <span class="kt">int</span> <span class="n">veryLongArgumentName</span> <span class="p">=</span> <span class="m">1234</span><span class="p">;</span>
      <span class="kt">int</span> <span class="n">shortArg</span> <span class="p">=</span> <span class="m">1</span><span class="p">;</span>
      <span class="c1">// If possible, wrap arguments by aligning newlines with the first argument.</span>
      <span class="nf">AnotherLongFunctionNameThatCausesLineWrappingProblems</span><span class="p">(</span><span class="n">shortArg</span><span class="p">,</span> <span class="n">shortArg</span><span class="p">,</span>
                                                            <span class="n">veryLongArgumentName</span><span class="p">);</span>
      <span class="c1">// If aligning argument lines with the first argument doesn't fit, or is difficult to</span>
      <span class="c1">// read, wrap all arguments on new lines with a 4 space indent.</span>
      <span class="nf">AnotherLongFunctionNameThatCausesLineWrappingProblems</span><span class="p">(</span>
          <span class="n">veryLongArgumentName</span><span class="p">,</span> <span class="n">veryLongArgumentName</span><span class="p">,</span> <span class="n">veryLongArgumentName</span><span class="p">);</span>
    <span class="p">}</span>
  <span class="p">}</span>
<span class="p">}</span>
</code></pre></div></div>

<h2 id="c-coding-guidelines">C# coding guidelines</h2>

<h3 id="constants">Constants</h3>

<ul>
  <li>Variables and fields that can be made <code class="language-plaintext highlighter-rouge">const</code> should always be made <code class="language-plaintext highlighter-rouge">const</code>.</li>
  <li>If <code class="language-plaintext highlighter-rouge">const</code> isn’t possible, <code class="language-plaintext highlighter-rouge">readonly</code> can be a suitable alternative.</li>
  <li>Prefer named constants to magic numbers.</li>
</ul>

<h3 id="ienumerable-vs-ilist-vs-ireadonlylist">IEnumerable vs IList vs IReadOnlyList</h3>

<ul>
  <li>For inputs use the most restrictive collection type possible, for example
<code class="language-plaintext highlighter-rouge">IReadOnlyCollection</code> / <code class="language-plaintext highlighter-rouge">IReadOnlyList</code> / <code class="language-plaintext highlighter-rouge">IEnumerable</code> as inputs to methods
when the inputs should be immutable.</li>
  <li>For outputs, if passing ownership of the returned container to the owner,
prefer <code class="language-plaintext highlighter-rouge">IList</code> over <code class="language-plaintext highlighter-rouge">IEnumerable</code>. If not transferring ownership, prefer the
most restrictive option.</li>
</ul>

<h3 id="generators-vs-containers">Generators vs containers</h3>

<ul>
  <li>Use your best judgement, bearing in mind:
    <ul>
      <li>Generator code is often less readable than filling in a container.</li>
      <li>Generator code can be more performant if the results are going to be
processed lazily, e.g. when not all the results are needed.</li>
      <li>Generator code that is directly turned into a container via <code class="language-plaintext highlighter-rouge">ToList()</code>
will be less performant than filling in a container directly.</li>
      <li>Generator code that is called multiple times will be considerably slower
than iterating over a container multiple times.</li>
    </ul>
  </li>
</ul>

<h3 id="property-styles">Property styles</h3>

<ul>
  <li>For single line read-only properties, prefer expression body properties
(<code class="language-plaintext highlighter-rouge">=&gt;</code>) when possible.</li>
  <li>For everything else, use the older <code class="language-plaintext highlighter-rouge">{ get; set; }</code> syntax.</li>
</ul>

<h3 id="expression-body-syntax">Expression body syntax</h3>

<p>For example:</p>

<div class="language-c# highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="kt">int</span> <span class="n">SomeProperty</span> <span class="p">=&gt;</span> <span class="n">_someProperty</span>
</code></pre></div></div>

<ul>
  <li>Judiciously use expression body syntax in lambdas and properties.</li>
  <li>Don’t use on method definitions. This will be reviewed when C# 7 is live,
which uses this syntax heavily.</li>
  <li>As with methods and other scoped blocks of code, align the closing with the
first character of the line that includes the opening brace. See sample code
for examples.</li>
</ul>

<h3 id="structs-and-classes">Structs and classes:</h3>

<ul>
  <li>
    <p>Structs are very different from classes:</p>

    <ul>
      <li>Structs are always passed and returned by value.</li>
      <li>Assigning a value to a member of a returned struct doesn’t modify the
original - e.g. <code class="language-plaintext highlighter-rouge">transform.position.x = 10</code> doesn’t set the transform’s
position.x to 10; <code class="language-plaintext highlighter-rouge">position</code> here is a property that returns a <code class="language-plaintext highlighter-rouge">Vector3</code>
by value, so this just sets the x parameter of a copy of the original.</li>
    </ul>
  </li>
  <li>
    <p>Almost always use a class.</p>
  </li>
  <li>
    <p>Consider struct when the type can be treated like other value types - for
example, if instances of the type are small and commonly short-lived or are
commonly embedded in other objects. Good examples include Vector3,
Quaternion and Bounds.</p>
  </li>
  <li>
    <p>Note that this guidance may vary from team to team where, for example,
performance issues might force the use of structs.</p>
  </li>
</ul>

<h3 id="lambdas-vs-named-methods">Lambdas vs named methods</h3>

<ul>
  <li>If a lambda is non-trivial (e.g. more than a couple of statements, excluding
declarations), or is reused in multiple places, it should probably be a
named method.</li>
</ul>

<h3 id="field-initializers">Field initializers</h3>

<ul>
  <li>Field initializers are generally encouraged.</li>
</ul>

<h3 id="extension-methods">Extension methods</h3>

<ul>
  <li>Only use an extension method when the source of the original class is not
available, or else when changing the source is not feasible.</li>
  <li>Only use an extension method if the functionality being added is a ‘core’
general feature that would be appropriate to add to the source of the
original class.
    <ul>
      <li>Note - if we have the source to the class being extended, and the
maintainer of the original class does not want to add the function,
prefer not using an extension method.</li>
    </ul>
  </li>
  <li>Only put extension methods into core libraries that are available
everywhere - extensions that are only available in some code will become a
readability issue.</li>
  <li>Be aware that using extension methods always obfuscates the code, so err on
the side of not adding them.</li>
</ul>

<h3 id="ref-and-out">ref and out</h3>

<ul>
  <li>Use <code class="language-plaintext highlighter-rouge">out</code> for returns that are not also inputs.</li>
  <li>Place <code class="language-plaintext highlighter-rouge">out</code> parameters after all other parameters in the method definition.</li>
  <li><code class="language-plaintext highlighter-rouge">ref</code> should be used rarely, when mutating an input is necessary.</li>
  <li>Do not use <code class="language-plaintext highlighter-rouge">ref</code> as an optimisation for passing structs.</li>
  <li>Do not use <code class="language-plaintext highlighter-rouge">ref</code> to pass a modifiable container into a method. <code class="language-plaintext highlighter-rouge">ref</code> is only
required when the supplied container needs be replaced with an entirely
different container instance.</li>
</ul>

<h3 id="linq">LINQ</h3>

<ul>
  <li>In general, prefer single line LINQ calls and imperative code, rather than
long chains of LINQ. Mixing imperative code and heavily chained LINQ is
often hard to read.</li>
  <li>Prefer member extension methods over SQL-style LINQ keywords - e.g. prefer
<code class="language-plaintext highlighter-rouge">myList.Where(x)</code> to <code class="language-plaintext highlighter-rouge">myList where x</code>.</li>
  <li>Avoid <code class="language-plaintext highlighter-rouge">Container.ForEach(...)</code> for anything longer than a single statement.</li>
</ul>

<h3 id="array-vs-list">Array vs List</h3>

<ul>
  <li>In general, prefer <code class="language-plaintext highlighter-rouge">List&lt;&gt;</code> over arrays for public variables, properties,
and return types (keeping in mind the guidance on <code class="language-plaintext highlighter-rouge">IList</code> / <code class="language-plaintext highlighter-rouge">IEnumerable</code> /
<code class="language-plaintext highlighter-rouge">IReadOnlyList</code> above).</li>
  <li>Prefer <code class="language-plaintext highlighter-rouge">List&lt;&gt;</code> when the size of the container can change.</li>
  <li>Prefer arrays when the size of the container is fixed and known at
construction time.</li>
  <li>Prefer array for multidimensional arrays.</li>
  <li>Note:
    <ul>
      <li>array and <code class="language-plaintext highlighter-rouge">List&lt;&gt;</code> both represent linear, contiguous containers.</li>
      <li>Similar to C++ arrays vs <code class="language-plaintext highlighter-rouge">std::vector</code>, arrays are of fixed capacity,
whereas <code class="language-plaintext highlighter-rouge">List&lt;&gt;</code> can be added to.</li>
      <li>In some cases arrays are more performant, but in general <code class="language-plaintext highlighter-rouge">List&lt;&gt;</code> is
more flexible.</li>
    </ul>
  </li>
</ul>

<h3 id="folders-and-file-locations">Folders and file locations</h3>

<ul>
  <li>Be consistent with the project.</li>
  <li>Prefer a flat structure where possible.</li>
</ul>

<h3 id="use-of-tuple-as-a-return-type">Use of tuple as a return type</h3>

<ul>
  <li>In general, prefer a named class type over <code class="language-plaintext highlighter-rouge">Tuple&lt;&gt;</code>, particularly when
returning complex types.</li>
</ul>

<h3 id="string-interpolation-vs-stringformat-vs-stringconcat-vs-operator">String interpolation vs <code class="language-plaintext highlighter-rouge">String.Format()</code> vs <code class="language-plaintext highlighter-rouge">String.Concat</code> vs <code class="language-plaintext highlighter-rouge">operator+</code></h3>

<ul>
  <li>In general, use whatever is easiest to read, particularly for logging and
assert messages.</li>
  <li>Be aware that chained <code class="language-plaintext highlighter-rouge">operator+</code> concatenations will be slower and cause
significant memory churn.</li>
  <li>If performance is a concern, <code class="language-plaintext highlighter-rouge">StringBuilder</code> will be faster for multiple
string concatenations.</li>
</ul>

<h3 id="using"><code class="language-plaintext highlighter-rouge">using</code></h3>

<ul>
  <li>Generally, don’t alias long typenames with <code class="language-plaintext highlighter-rouge">using</code>. Often this is a sign
that a <code class="language-plaintext highlighter-rouge">Tuple&lt;&gt;</code> needs to be turned into a class.
    <ul>
      <li>e.g. <code class="language-plaintext highlighter-rouge">using RecordList = List&lt;Tuple&lt;int, float&gt;&gt;</code> should probably be a
named class instead.</li>
    </ul>
  </li>
  <li>Be aware that <code class="language-plaintext highlighter-rouge">using</code> statements are only file scoped and so of limited use.
Type aliases will not be available for external users.</li>
</ul>

<h3 id="object-initializer-syntax">Object Initializer syntax</h3>

<p>For example:</p>

<div class="language-c# highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="kt">var</span> <span class="n">x</span> <span class="p">=</span> <span class="k">new</span> <span class="n">SomeClass</span> <span class="p">{</span>
  <span class="n">Property1</span> <span class="p">=</span> <span class="n">value1</span><span class="p">,</span>
  <span class="n">Property2</span> <span class="p">=</span> <span class="n">value2</span><span class="p">,</span>
<span class="p">};</span>
</code></pre></div></div>

<ul>
  <li>Object Initializer Syntax is fine for ‘plain old data’ types.</li>
  <li>Avoid using this syntax for classes or structs with constructors.</li>
  <li>If splitting across multiple lines, indent one block level.</li>
</ul>

<h3 id="namespace-naming">Namespace naming</h3>

<ul>
  <li>In general, namespaces should be no more than 2 levels deep.</li>
  <li>Don’t force file/folder layout to match namespaces.</li>
  <li>For shared library/module code, use namespaces. For leaf ‘application’ code,
such as <code class="language-plaintext highlighter-rouge">unity_app</code>, namespaces are not necessary.</li>
  <li>New top-level namespace names must be globally unique and recognizable.</li>
</ul>

<h3 id="default-valuesnull-returns-for-structs">Default values/null returns for structs</h3>

<ul>
  <li>Prefer returning a ‘success’ boolean value and a struct <code class="language-plaintext highlighter-rouge">out</code> value.</li>
  <li>Where performance isn’t a concern and the resulting code significantly more
readable (e.g. chained null conditional operators vs deeply nested if
statements) nullable structs are acceptable.</li>
  <li>
    <p>Notes:</p>

    <ul>
      <li>Nullable structs are convenient, but reinforce the general ‘null is
failure’ pattern Google prefers to avoid. We will investigate a
<code class="language-plaintext highlighter-rouge">StatusOr</code> equivalent in the future, if there is enough demand.</li>
    </ul>
  </li>
</ul>

<h3 id="removing-from-containers-while-iterating">Removing from containers while iterating</h3>

<p>C# (like many other languages) does not provide an obvious mechanism for
removing items from containers while iterating. There are a couple of options:</p>

<ul>
  <li>If all that is required is to remove items that satisfy some condition,
<code class="language-plaintext highlighter-rouge">someList.RemoveAll(somePredicate)</code> is recommended.</li>
  <li>If other work needs to be done in the iteration, <code class="language-plaintext highlighter-rouge">RemoveAll</code> may not be
sufficient. A common alternative pattern is to create a new container
outside of the loop, insert items to keep in the new container, and swap the
original container with the new one at the end of iteration.</li>
</ul>

<h3 id="calling-delegates">Calling delegates</h3>

<ul>
  <li>When calling a delegate, use <code class="language-plaintext highlighter-rouge">Invoke()</code> and use the null conditional
operator - e.g. <code class="language-plaintext highlighter-rouge">SomeDelegate?.Invoke()</code>. This clearly marks the call at the
callsite as ‘a delegate that is being called’. The null check is concise and
robust against threading race conditions.</li>
</ul>

<h3 id="the-var-keyword">The <code class="language-plaintext highlighter-rouge">var</code> keyword</h3>

<ul>
  <li>Use of <code class="language-plaintext highlighter-rouge">var</code> is encouraged if it aids readability by avoiding type names
that are noisy, obvious, or unimportant.</li>
  <li>
    <p>Encouraged:</p>

    <ul>
      <li>When the type is obvious - e.g. <code class="language-plaintext highlighter-rouge">var apple = new Apple();</code>, or <code class="language-plaintext highlighter-rouge">var
request = Factory.Create&lt;HttpRequest&gt;();</code></li>
      <li>For transient variables that are only passed directly to other methods -
e.g. <code class="language-plaintext highlighter-rouge">var item = GetItem(); ProcessItem(item);</code></li>
    </ul>
  </li>
  <li>
    <p>Discouraged:</p>

    <ul>
      <li>When working with basic types - e.g. <code class="language-plaintext highlighter-rouge">var success = true;</code></li>
      <li>When working with compiler-resolved built-in numeric types - e.g. <code class="language-plaintext highlighter-rouge">var
number = 12 * ReturnsFloat();</code></li>
      <li>When users would clearly benefit from knowing the type - e.g. <code class="language-plaintext highlighter-rouge">var
listOfItems = GetList();</code></li>
    </ul>
  </li>
</ul>

<h3 id="attributes">Attributes</h3>

<ul>
  <li>Attributes should appear on the line above the field, property, or method
they are associated with, separated from the member by a newline.</li>
  <li>Multiple attributes should be separated by newlines. This allows for easier
adding and removing of attributes, and ensures each attribute is easy to
search for.</li>
</ul>

<h3 id="argument-naming">Argument Naming</h3>

<p>Derived from the Google C++ style guide.</p>

<p>When the meaning of a function argument is nonobvious, consider one of the
following remedies:</p>

<ul>
  <li>If the argument is a literal constant, and the same constant is used in
multiple function calls in a way that tacitly assumes they’re the same, use
a named constant to make that constraint explicit, and to guarantee that it
holds.</li>
  <li>Consider changing the function signature to replace a <code class="language-plaintext highlighter-rouge">bool</code> argument with
an <code class="language-plaintext highlighter-rouge">enum</code> argument. This will make the argument values self-describing.</li>
  <li>Replace large or complex nested expressions with named variables.</li>
  <li>Consider using
<a href="https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/named-and-optional-arguments">Named Arguments</a>
to clarify argument meanings at the call site.</li>
  <li>For functions that have several configuration options, consider defining a
single class or struct to hold all the options and pass an instance of that.
This approach has several advantages. Options are referenced by name at the
call site, which clarifies their meaning. It also reduces function argument
count, which makes function calls easier to read and write. As an added
benefit, call sites don’t need to be changed when another option is added.</li>
</ul>

<p>Consider the following example:</p>

<div class="language-c# highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="c1">// Bad - what are these arguments?</span>
<span class="n">DecimalNumber</span> <span class="n">product</span> <span class="p">=</span> <span class="nf">CalculateProduct</span><span class="p">(</span><span class="n">values</span><span class="p">,</span> <span class="m">7</span><span class="p">,</span> <span class="k">false</span><span class="p">,</span> <span class="k">null</span><span class="p">);</span>
</code></pre></div></div>

<p>versus:</p>

<div class="language-c# highlighter-rouge"><div class="highlight"><pre class="highlight"><code><span class="c1">// Good</span>
<span class="n">ProductOptions</span> <span class="n">options</span> <span class="p">=</span> <span class="k">new</span> <span class="nf">ProductOptions</span><span class="p">();</span>
<span class="n">options</span><span class="p">.</span><span class="n">PrecisionDecimals</span> <span class="p">=</span> <span class="m">7</span><span class="p">;</span>
<span class="n">options</span><span class="p">.</span><span class="n">UseCache</span> <span class="p">=</span> <span class="n">CacheUsage</span><span class="p">.</span><span class="n">DontUseCache</span><span class="p">;</span>
<span class="n">DecimalNumber</span> <span class="n">product</span> <span class="p">=</span> <span class="nf">CalculateProduct</span><span class="p">(</span><span class="n">values</span><span class="p">,</span> <span class="n">options</span><span class="p">,</span> <span class="n">completionDelegate</span><span class="p">:</span> <span class="k">null</span><span class="p">);</span>
</code></pre></div></div>
