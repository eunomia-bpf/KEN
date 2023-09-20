import { APIKeyInput } from '@/components/APIKeyInput';
import { CodeBlock } from '@/components/CodeBlock';
import { LanguageSelect } from '@/components/LanguageSelect';
import {preview_input_code, preview_output_code} from "@/components/ScriptTemplate"
import { BPFSelect, ModelSelect } from '@/components/ModelSelect';
import { TextBlock } from '@/components/TextBlock';
import { OpenAIModel, TranslateBody, BPF } from '@/types/types';
import Head from 'next/head';
import { useEffect, useState } from 'react';
import Header from '@/components/Header';
import Footer from '@/components/Footer';

export default function Home() {
  const start = "This is the start";
  const end = "This is the end";
  const [inputLanguage, setInputLanguage] = useState<string>('Help Doc');
  const [outputLanguage, setOutputLanguage] = useState<string>('Bash');
  const [inputCode, setInputCode] = useState<string>(preview_input_code);
  const [outputCode, setOutputCode] = useState<string>(preview_output_code);
  const [model, setModel] = useState<OpenAIModel>('gpt-3.5-turbo');
  const [bpfType, setBPF] = useState<BPF>('libbpf');
  const [loading, setLoading] = useState<boolean>(false);
  const [hasTranslated, setHasTranslated] = useState<boolean>(false);
  const [apiKey, setApiKey] = useState<string>('');

  const handleTranslate = async () => {
    const maxCodeLength = model === 'gpt-3.5-turbo' ? 6000 : 12000;

    if (!apiKey) {
      alert('Please enter an API key.');
      return;
    }

    if (inputLanguage === outputLanguage) {
      alert('Please select different languages.');
      return;
    }

    if (!inputCode) {
      alert('Please enter some code.');
      return;
    }

    if (inputCode.length > maxCodeLength) {
      alert(
        `Please enter code less than ${maxCodeLength} characters. You are currently at ${inputCode.length} characters.`,
      );
      return;
    }

    setLoading(true);
    setOutputCode('');

    const controller = new AbortController();
    const user_query = inputCode;
    const language = outputLanguage;
    const body: TranslateBody = {
      user_query,
      bpfType,
      model,
      apiKey,
    };

    const response = await fetch('http://127.0.0.1:4000', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      signal: controller.signal,
      body: JSON.stringify(body),
    });
    // const response = await fetch('http://127.0.0.1:4096?');

    if (!response.ok) {
      setLoading(false);
      alert('Something went wrong.');
      return;
    }

    const data = response.body;

    if (!data) {
      setLoading(false);
      alert('Something went wrong.');
      return;
    }

    const reader = data.getReader();
    const decoder = new TextDecoder();
    let done = false;
    let code = '';

    while (!done) {
      const { value, done: doneReading } = await reader.read();
      done = doneReading;
      const chunkValue = decoder.decode(value);

      code += chunkValue;

      setOutputCode((prevCode) => prevCode + chunkValue);
    }

    setLoading(false);
    setHasTranslated(true);
    copyToClipboard(code);
  };

  const copyToClipboard = (text: string) => {
    const el = document.createElement('textarea');
    el.value = text;
    document.body.appendChild(el);
    el.select();
    document.execCommand('copy');
    document.body.removeChild(el);
  };

  const handleApiKeyChange = (value: string) => {
    setApiKey(value);

    localStorage.setItem('apiKey', value);
  };

  useEffect(() => {
    if (hasTranslated) {
      handleTranslate();
    }
  }, [outputLanguage]);

  useEffect(() => {
    const apiKey = localStorage.getItem('apiKey');

    if (apiKey) {
      setApiKey(apiKey);
    }
  }, []);

  return (
    <div className="flex max-w-5xl mx-auto flex-col items-center justify-center py-2 min-h-screen">
      {/* <Head>
        <title>Bpftrace Program Generate</title>
        <link rel="icon" href="/favicon.ico" />
      </Head> */}
      <Header />
 
      {/* <div className="flex h-full min-h-screen flex-col items-center bg-[#0E1117] px-4 pb-20 text-neutral-200 sm:px-10"> */}
        {/* <h1 className="sm:text-6xl text-4xl max-w-[708px] font-bold text-slate-900 text-center">
          Generate GitHub Profile README with GPT
        </h1> */}

        <div className="mt-0 flex flex-col items-center justify-center sm:mt-5">
          <div className="mt-0 text-center text-sm">
            <b>Your one-click solution to transforming natural language into a bpftrace program!</b> <br></br>
            <u>Save the generated multi-line bpftrace program as a `bpftrace.bt` file then execute it with `sudo bpftrace bpftrace.bt`.</u>
          </div>
        </div>

        <div className="mt-6 text-center text-sm">
          <APIKeyInput apiKey={apiKey} onChange={handleApiKeyChange} />
        </div>

        <div className="mt-2 flex items-center space-x-2">
          <ModelSelect model={model} onChange={(value) => setModel(value)} />

          <BPFSelect bpfType={bpfType} onChange={(value) => setBPF(value)} />

          <button
            className="w-[140px] cursor-pointer rounded-md bg-violet-500 px-4 py-2 font-bold hover:bg-violet-600 active:bg-violet-700"
            onClick={() => handleTranslate()}
            disabled={loading}
          >
            {loading ? 'Generating...' : 'Generate'}
          </button>
        </div>

        <div className="mt-2 text-center text-xs">
          {loading
            ? 'Generating...'
            : hasTranslated
            ? 'Output copied to clipboard!'
            : 'Enter the description of the program and click "Generate"'}
        </div>

        {/* <div className="mt-6 flex w-full max-w-[1200px] flex-col justify sm:flex-row sm:space-x-4"> */}

          <div className="h-100 flex flex-col max-w-[1400px] justify-center space-y-2 sm:w-2/4">
            {/* <div className="w-full rounded-md bg-[#1F2937] px-4 py-2 text-neutral-200" style={{ display: 'flex', alignItems: 'center' }}>
              Program Description
            </div> */}
            <input
              type="text"
              onChange={(e) => setInputCode(e.target.value)}
              className="w-full rounded-md bg-[#1F2937] px-4 py-2 text-neutral-200" style={{ display: 'flex', alignItems: 'center' }}
              placeholder="Enter the description of the bpf program."
            />

            {inputLanguage === 'Natural Language' ? (
              <TextBlock
                text={outputCode}
                editable={!loading}
                onChange={(value) => {
                  setOutputCode(value);
                  setHasTranslated(false);
                }}
              />
            ) : (
              <CodeBlock
                code={outputCode}
                editable={!loading}
                onChange={(value) => {
                  setOutputCode(value);
                  setHasTranslated(false);
                }}
              />
            )}
          </div>
          {/* <div className="mt-8 flex h-full flex-col justify-center space-y-2 sm:mt-0 sm:w-2/4">
            <div className="w-full rounded-md bg-[#1F2937] px-4 py-2 text-neutral-200" style={{ display: 'flex', alignItems: 'center' }}>
              Bpftrace Program
            </div>
            {outputLanguage === 'Bash' ? (
              <CodeBlock code={`${outputCode}`} />
            ) : (
              <CodeBlock code={`${outputCode}`} />
            )}

          </div> */}
        {/* </div> */}
        <Footer />
    </div>
  );
}
