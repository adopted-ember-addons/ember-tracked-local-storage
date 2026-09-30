import { pageTitle } from 'ember-page-title';
import TopBar from '../components/top-bar.gts';
import Header from '../components/header.gts';
import SideNavigation from '../components/side-navigation.gts';
import BottomNav from '../components/bottom-nav.gts';
import {
  allRoutes,
  apiReferenceRoutes,
  introductionRoutes,
} from '../routes.js';

<template>
  {{pageTitle "Ember Tracked Local Storage"}}

  <div class="pb-12">
    <TopBar />

    <Header />

    <div class="container mx-auto flex mt-12">
      <div class="w-4/12 pr-4">
        <SideNavigation
          @routes={{introductionRoutes}}
          @title="Getting started"
        />
        <SideNavigation @routes={{apiReferenceRoutes}} @title="API Reference" />
      </div>
      <div class="w-8/12 pl-4">
        {{outlet}}

        <BottomNav @routes={{allRoutes}} />
      </div>
    </div>
  </div>
</template>
