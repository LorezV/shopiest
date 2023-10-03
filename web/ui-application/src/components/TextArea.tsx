import { TextareaHTMLAttributes, Ref, forwardRef } from "react";

interface TextAreaProps extends TextareaHTMLAttributes<HTMLTextAreaElement> { }

export default forwardRef(({ className, ...textareaProps }: TextAreaProps, ref: Ref<HTMLTextAreaElement>) => {
    return (
        <textarea rows={5} className={["px-4 py-2 outline-none border-b focus:border-orange-400 transition-colors", className].join(" ")} {...textareaProps} ref={ref} />
    )
})