import Component from '@glimmer/component';
import { on } from '@ember/modifier';
import { trackedInLocalStorage } from '#src/utils/tracked-in-local-storage.js';

export default class ColorDemo extends Component {
  colors = [
    'bg-red-400',
    'bg-orange-400',
    'bg-yellow-400',
    'bg-green-400',
    'bg-indigo-400',
    'bg-pink-400',
  ];

  @trackedInLocalStorage({
    defaultValue: 'bg-red-400',
  })
  currentColor;

  changeColour = () => {
    this.currentColor = this.chooseRandomNewColor();
  };

  chooseRandomNewColor() {
    const colors = [...this.colors];
    colors.splice(this.colors.indexOf(this.currentColor), 1);
    return colors[Math.floor(Math.random() * colors.length)];
  }

  <template>
    <div
      class="h-40 w-40
        {{this.currentColor}}
        cursor-pointer flex items-center justify-center"
      role="button"
      {{on "click" this.changeColour}}
      ...attributes
    >
      Click me!
    </div>
  </template>
}
