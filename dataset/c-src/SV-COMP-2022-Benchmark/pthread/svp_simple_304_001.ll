; ModuleID = 'svp_simple_304_001.bc'
source_filename = "./svp_simple_304_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@data = global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_304_001_isr_1(i8* %0) #0 !dbg !12 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !13
  %4 = bitcast i32* %3 to i8*, !dbg !17
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #4, !dbg !17
  %5 = load i32, i32* @data, align 4, !dbg !18, !tbaa !19
  %6 = add nsw i32 %5, 1, !dbg !21
  store i32 %6, i32* %3, align 4, !dbg !22, !tbaa !19
  %7 = load i32, i32* %3, align 4, !dbg !23, !tbaa !19
  store i32 %7, i32* @data, align 4, !dbg !24, !tbaa !19
  %8 = bitcast i32* %3 to i8*, !dbg !25
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #4, !dbg !25
  ret void, !dbg !25
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_304_001_isr_2(i8* %0) #0 !dbg !26 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !13
  %4 = bitcast i32* %3 to i8*, !dbg !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #4, !dbg !27
  %5 = load i32, i32* @data, align 4, !dbg !28, !tbaa !19
  %6 = add nsw i32 %5, 2, !dbg !29
  store i32 %6, i32* %3, align 4, !dbg !30, !tbaa !19
  %7 = load i32, i32* %3, align 4, !dbg !31, !tbaa !19
  store i32 %7, i32* @data, align 4, !dbg !32, !tbaa !19
  %8 = bitcast i32* %3 to i8*, !dbg !33
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #4, !dbg !33
  ret void, !dbg !33
}

; Function Attrs: nounwind uwtable
define void @svp_simple_304_001_isr_3(i8* %0) #0 !dbg !34 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !13
  %3 = load i32, i32* @data, align 4, !dbg !35, !tbaa !19
  %4 = icmp sge i32 %3, 3, !dbg !36
  br i1 %4, label %5, label %7, !dbg !35

5:                                                ; preds = %1
  br label %6, !dbg !37

6:                                                ; preds = %5
  call void @reach_error(), !dbg !38
  call void @abort() #5, !dbg !39
  unreachable, !dbg !39

7:                                                ; preds = %1
  ret void, !dbg !40
}

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: nounwind uwtable
define i32 @svp_simple_304_001_main() #0 !dbg !41 {
  ret i32 0, !dbg !42
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_304_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_304_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 2, column: 22, scope: !7)
!11 = !DILocation(line: 2, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "svp_simple_304_001_isr_1", scope: !8, file: !8, line: 6, type: !9, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !{!14, !14, i64 0}
!14 = !{!"any pointer", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 8, column: 3, scope: !12)
!18 = !DILocation(line: 8, column: 13, scope: !12)
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !15, i64 0}
!21 = !DILocation(line: 8, column: 18, scope: !12)
!22 = !DILocation(line: 8, column: 7, scope: !12)
!23 = !DILocation(line: 9, column: 9, scope: !12)
!24 = !DILocation(line: 9, column: 8, scope: !12)
!25 = !DILocation(line: 11, column: 1, scope: !12)
!26 = distinct !DISubprogram(name: "svp_simple_304_001_isr_2", scope: !8, file: !8, line: 14, type: !9, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!27 = !DILocation(line: 16, column: 3, scope: !26)
!28 = !DILocation(line: 16, column: 13, scope: !26)
!29 = !DILocation(line: 16, column: 18, scope: !26)
!30 = !DILocation(line: 16, column: 7, scope: !26)
!31 = !DILocation(line: 17, column: 9, scope: !26)
!32 = !DILocation(line: 17, column: 8, scope: !26)
!33 = !DILocation(line: 18, column: 1, scope: !26)
!34 = distinct !DISubprogram(name: "svp_simple_304_001_isr_3", scope: !8, file: !8, line: 21, type: !9, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 23, column: 7, scope: !34)
!36 = !DILocation(line: 23, column: 12, scope: !34)
!37 = !DILocation(line: 23, column: 17, scope: !34)
!38 = !DILocation(line: 24, column: 13, scope: !34)
!39 = !DILocation(line: 24, column: 27, scope: !34)
!40 = !DILocation(line: 26, column: 1, scope: !34)
!41 = distinct !DISubprogram(name: "svp_simple_304_001_main", scope: !8, file: !8, line: 29, type: !9, scopeLine: 30, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 31, column: 3, scope: !41)
