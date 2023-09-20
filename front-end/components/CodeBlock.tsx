import { StreamLanguage } from '@codemirror/language';
// import { StreamLanguage } from '@codemirror/legacy-modes';
// import go from '@codemirror/legacy-modes/mode/go';
// import {lua} from "@codemirror/legacy-modes/mode/lua";
import { tokyoNight } from '@uiw/codemirror-theme-tokyo-night';
import CodeMirror from '@uiw/react-codemirror';
import { FC, useEffect, useState } from 'react';

interface Props {
  code: string;
  editable?: boolean;
  onChange?: (value: string) => void;
}

export const CodeBlock: FC<Props> = ({
  code,
  editable = false,
  onChange = () => {},
}) => {
  const [copyText, setCopyText] = useState<string>('Copy');

  useEffect(() => {
    const timeout = setTimeout(() => {
      setCopyText('Copy');
    }, 2000);

    return () => clearTimeout(timeout);
  }, [copyText]);

  return (
    <div className="relative" style={{ maxHeight: '300px', overflow: 'auto' }}>
      <button
        className="absolute right-0 top-0 z-10 rounded bg-[#1A1B26] p-1 text-xs text-white hover:bg-[#2D2E3A] active:bg-[#2D2E3A]"
        onClick={() => {
          navigator.clipboard.writeText(code);
          setCopyText('Copied!');
        }}
      >
        {copyText}
      </button>
      <div className="rounded-md">
        <CodeMirror
          editable={editable}
          value={code}
          minHeight="300px"
          // extensions={[StreamLanguage.define(go)]}
          theme={tokyoNight}
          onChange={(value) => onChange(value)}
        />
      </div>

    </div>
  );
};

