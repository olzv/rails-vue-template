<template>
  <div id="app" class="ui main text container">

    <router-view></router-view>

    <div v-show="!isRootPath()">
      <br>
      <br>
      <router-link :to="{ name: 'root' }">Home</router-link>
    </div>

  </div>
</template>

<script>
  export default {
    data: function () {
      return {
        someData: "Some data on the dashboard!"
      }
    },
    methods: {
      isRootPath: function () {
        return this.$router.currentRoute.name == 'root'
      }
    }
  }
</script>

<style scoped>
  .main.container {
    margin-top: 2em;
  }
</style>
