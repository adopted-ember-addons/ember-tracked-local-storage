import { hash } from '@ember/helper';
import Paragraph from './paragraph.gts';
import CodeSnippet from './code-snippet.gts';
import ImportantNote from './important-note.gts';

<template>
  <section class="mb-6">
    <h3
      data-content-section-header
      class="text-3xl font-bold text-gray-800 mb-4"
    >
      {{@title}}
    </h3>

    <div class="flex flex-col">
      {{yield (hash P=Paragraph Code=CodeSnippet Note=ImportantNote)}}
    </div>
  </section>
</template>
