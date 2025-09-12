; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/kimi/svp_simple_601_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_601_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@x = local_unnamed_addr global i32 1, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_601_001_isr_1(i8* %arg) local_unnamed_addr #0 !dbg !14 {
entry:
  %arg.addr = alloca i8*, align 8
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32, i32* @x, align 4, !dbg !20
  %cmp = icmp eq i32 %0, 1, !dbg !22
  br i1 %cmp, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !24

if.end:                                           ; preds = %if.then, %entry
  store i32 -1, i32* @x, align 4, !dbg !26
  ret void, !dbg !27
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_601_001_main() local_unnamed_addr #0 !dbg !28 {
entry:
  %0 = load i32, i32* @x, align 4, !dbg !31
  %cmp = icmp eq i32 %0, 1, !dbg !32
  %conv = zext i1 %cmp to i32, !dbg !32
  %call = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 %conv), !dbg !33
  store i32 0, i32* @x, align 4, !dbg !34
  %1 = load i32, i32* @x, align 4, !dbg !35
  %cmp1 = icmp eq i32 %1, 0, !dbg !36
  %conv2 = zext i1 %cmp1 to i32, !dbg !36
  %call3 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 %conv2), !dbg !37
  store i32 1, i32* @x, align 4, !dbg !38
  ret i32 0, !dbg !39
}

declare i32 @assert(...) local_unnamed_addr #2

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "x", scope: !2, file: !6, line: 2, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_601_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_601_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "svp_simple_601_001_isr_1", scope: !6, file: !6, line: 4, type: !15, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "arg", arg: 1, scope: !14, file: !6, line: 4, type: !17)
!19 = !DILocation(line: 4, column: 37, scope: !14)
!20 = !DILocation(line: 7, column: 7, scope: !21)
!21 = distinct !DILexicalBlock(scope: !14, file: !6, line: 7, column: 7)
!22 = !DILocation(line: 7, column: 9, scope: !21)
!23 = !DILocation(line: 7, column: 7, scope: !14)
!24 = !DILocation(line: 9, column: 3, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !6, line: 8, column: 3)
!26 = !DILocation(line: 11, column: 5, scope: !14)
!27 = !DILocation(line: 12, column: 1, scope: !14)
!28 = distinct !DISubprogram(name: "svp_simple_601_001_main", scope: !6, file: !6, line: 14, type: !29, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!29 = !DISubroutineType(types: !30)
!30 = !{!7}
!31 = !DILocation(line: 16, column: 10, scope: !28)
!32 = !DILocation(line: 16, column: 12, scope: !28)
!33 = !DILocation(line: 16, column: 3, scope: !28)
!34 = !DILocation(line: 18, column: 5, scope: !28)
!35 = !DILocation(line: 19, column: 10, scope: !28)
!36 = !DILocation(line: 19, column: 12, scope: !28)
!37 = !DILocation(line: 19, column: 3, scope: !28)
!38 = !DILocation(line: 20, column: 5, scope: !28)
!39 = !DILocation(line: 22, column: 3, scope: !28)
