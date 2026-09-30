import Component from '@glimmer/component';
import { service } from '@ember/service';
import { LinkTo } from '@ember/routing';

export default class BottomNav extends Component {
  @service router;

  get currentRouteIndex() {
    const currentRoute = this.args.routes.find(
      ({ route }) => this.router.currentRouteName === route,
    );
    return this.args.routes.indexOf(currentRoute);
  }

  get previousRoute() {
    return this.args.routes[this.currentRouteIndex - 1];
  }

  get nextRoute() {
    return this.args.routes[this.currentRouteIndex + 1];
  }

  <template>
    <div class="flex {{if this.previousRoute 'justify-between' 'justify-end'}}">
      {{#if this.previousRoute}}
        <LinkTo
          class="w-56 hover:bg-gray-200 p-2 transition duration-200 rounded"
          @route={{this.previousRoute.route}}
        >
          <p>Previous</p>
          <p class="text-blue text-lg">{{this.previousRoute.name}}</p>
        </LinkTo>
      {{/if}}

      {{#if this.nextRoute}}
        <LinkTo
          class="text-right w-56 hover:bg-gray-200 p-2 transition duration-200 rounded"
          @route={{this.nextRoute.route}}
        >
          <p>Next</p>
          <p class="text-blue text-lg">{{this.nextRoute.name}}</p>
        </LinkTo>
      {{/if}}
    </div>
  </template>
}
