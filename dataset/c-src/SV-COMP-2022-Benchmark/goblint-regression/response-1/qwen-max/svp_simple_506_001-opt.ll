; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/qwen-max/svp_simple_506_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_506_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@glob = common local_unnamed_addr global i32 0, align 4, !dbg !0

; Function Attrs: noinline noreturn nounwind optnone ssp uwtable
define void @f() local_unnamed_addr #0 !dbg !14 {
entry:
  %tmp = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* @glob, align 4, !dbg !19
  %add = add nsw i32 %0, 1, !dbg !20
  store i32 %add, i32* %tmp, align 4, !dbg !18
  %1 = load i32, i32* @glob, align 4, !dbg !21
  %add1 = add nsw i32 %1, 1, !dbg !22
  store i32 %add1, i32* @glob, align 4, !dbg !23
  call void @exit(i32 0) #4, !dbg !24
  unreachable, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noreturn
declare void @exit(i32) local_unnamed_addr #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_506_001_isr_1(i8* %arg) local_unnamed_addr #3 !dbg !25 {
entry:
  %arg.addr = alloca i8*, align 8
  %tmp = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = load i32, i32* @glob, align 4, !dbg !33
  %add = add nsw i32 %0, 1, !dbg !34
  store i32 %add, i32* %tmp, align 4, !dbg !32
  %1 = load i32, i32* @glob, align 4, !dbg !35
  %add1 = add nsw i32 %1, 1, !dbg !36
  store i32 %add1, i32* @glob, align 4, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline noreturn nounwind optnone ssp uwtable
define i32 @svp_simple_506_001_main() local_unnamed_addr #0 !dbg !39 {
entry:
  call void @f(), !dbg !42
  unreachable
}

attributes #0 = { noinline noreturn nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "glob", scope: !2, file: !6, line: 5, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_506_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_506_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "f", scope: !6, file: !6, line: 8, type: !15, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "tmp", scope: !14, file: !6, line: 9, type: !7)
!18 = !DILocation(line: 9, column: 7, scope: !14)
!19 = !DILocation(line: 9, column: 13, scope: !14)
!20 = !DILocation(line: 9, column: 17, scope: !14)
!21 = !DILocation(line: 10, column: 10, scope: !14)
!22 = !DILocation(line: 10, column: 14, scope: !14)
!23 = !DILocation(line: 10, column: 8, scope: !14)
!24 = !DILocation(line: 13, column: 3, scope: !14)
!25 = distinct !DISubprogram(name: "svp_simple_506_001_isr_1", scope: !6, file: !6, line: 16, type: !26, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !28}
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!29 = !DILocalVariable(name: "arg", arg: 1, scope: !25, file: !6, line: 16, type: !28)
!30 = !DILocation(line: 16, column: 37, scope: !25)
!31 = !DILocalVariable(name: "tmp", scope: !25, file: !6, line: 17, type: !7)
!32 = !DILocation(line: 17, column: 7, scope: !25)
!33 = !DILocation(line: 17, column: 13, scope: !25)
!34 = !DILocation(line: 17, column: 17, scope: !25)
!35 = !DILocation(line: 18, column: 8, scope: !25)
!36 = !DILocation(line: 18, column: 12, scope: !25)
!37 = !DILocation(line: 18, column: 7, scope: !25)
!38 = !DILocation(line: 21, column: 1, scope: !25)
!39 = distinct !DISubprogram(name: "svp_simple_506_001_main", scope: !6, file: !6, line: 23, type: !40, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DISubroutineType(types: !41)
!41 = !{!7}
!42 = !DILocation(line: 28, column: 3, scope: !39)
