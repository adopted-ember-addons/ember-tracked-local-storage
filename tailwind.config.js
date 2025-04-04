module.exports = {
  content: ['./tests/dummy/app/**/*.{gjs,gts,hbs,html,js,ts}'],
  theme: {
    extend: {
      colors: {
        purple: '#7e55bd',
        blue: '#2DA2C5',
      },
      transformOrigin: {
        full: '100%',
      },
    },
    fontFamily: {
      sans: ['Lato', 'sans-serif'],
    },
    boxShadow: {
      default: '0 5px 20px rgba(0,0,0,0.05)',
    },
    container: {
      padding: '6rem',
    },
  },
  variants: {},
  plugins: [],
};
