<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <p>teste git</p>
  </div>
</template>

<style scoped lang="scss" />

<script lang="ts">
import { Component, Prop, Vue } from "vue-property-decorator";

@Component
export default class HelloWorld extends Vue {
  @Prop() private msg!: string;
}
</script>
