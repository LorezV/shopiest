import type {Meta, StoryObj} from '@storybook/svelte';

import {Checkbox} from "$lib";

// More on how to set up stories at: https://storybook.js.org/docs/svelte/writing-stories/introduction
const meta: Meta<Checkbox> = {
    title: 'Elements/Checkbox',
    component: Checkbox,
    tags: ['autodocs'],
    argTypes: {
        type: {control: 'select', options: ["primary", "secondary", "soft"]},
        size: {control: {type: 'select'}, options: ['sm', 'base', 'lg', "xl", '2xl']},
    },
};

export default meta;
type Story = StoryObj<typeof Checkbox>;

// More on writing stories with args: https://storybook.js.org/docs/svelte/writing-stories/args
export const Primary: Story = {
    args: {
        type: "primary"
    },
};

export const Secondary: Story = {
    args: {
        type: "secondary"
    },
};

export const Soft: Story = {
    args: {
        type: "soft"
    },
};
