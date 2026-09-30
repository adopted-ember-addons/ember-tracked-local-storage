import Component from '@glimmer/component';
import { htmlSafe } from '@ember/template';
import Prism from 'prismjs';
import 'prismjs/themes/prism.css';

// Highlights a static docs snippet with Prism. The snippets are this site's
// own source strings, never user input, so rendering Prism's HTML is safe.
export default class CodeSnippet extends Component {
  get language() {
    return this.args.language ?? 'markup';
  }

  get highlighted() {
    const grammar = Prism.languages[this.language] ?? Prism.languages.markup;

    return htmlSafe(Prism.highlight(this.args.code, grammar, this.language));
  }

  <template>
    <div class="mb-4">
      <pre class="language-{{this.language}}"><code
          class="language-{{this.language}}"
        >{{this.highlighted}}</code></pre>
    </div>
  </template>
}
