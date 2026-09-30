// The docs pages, in reading order. The side navigation shows them in two
// groups, and the bottom navigation steps through all of them in this order.
export const introductionRoutes = [
  { route: 'index', name: 'Introduction' },
  { route: 'installation', name: 'Installation' },
  { route: 'how-to-use-it', name: 'How to use it' },
  { route: 'service-class', name: 'Tracked local storage service' },
  { route: 'global-prefixes', name: 'Global prefixes' },
];

export const apiReferenceRoutes = [
  { route: 'tracked-in-local-storage-api', name: 'trackedInLocalStorage' },
  { route: 'tracked-local-storage-service-api', name: 'trackedLocalStorage' },
];

export const allRoutes = [...introductionRoutes, ...apiReferenceRoutes];
