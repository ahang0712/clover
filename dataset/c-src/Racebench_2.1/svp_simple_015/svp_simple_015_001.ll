; ModuleID = 'svp_simple_015_001.bc'
source_filename = "./svp_simple_015_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_015_001_global_var1 = common global i32 0, align 4
@svp_simple_015_001_global_var2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_015_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void (...) @init(), !dbg !10
  %5 = bitcast i32* %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #3, !dbg !11
  %6 = call i32 (...) @rand(), !dbg !12
  store i32 %6, i32* %1, align 4, !dbg !13, !tbaa !14
  %7 = bitcast i32* %2 to i8*, !dbg !18
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #3, !dbg !18
  %8 = call i32 (...) @rand(), !dbg !19
  store i32 %8, i32* %2, align 4, !dbg !20, !tbaa !14
  %9 = bitcast i32* %3 to i8*, !dbg !21
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #3, !dbg !21
  %10 = bitcast i32* %4 to i8*, !dbg !22
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #3, !dbg !22
  %11 = call i32 (...) @rand(), !dbg !23
  store i32 %11, i32* %4, align 4, !dbg !24, !tbaa !14
  %12 = load volatile i32, i32* @svp_simple_015_001_global_var1, align 4, !dbg !25, !tbaa !14
  %13 = load i32, i32* %2, align 4, !dbg !26, !tbaa !14
  %14 = icmp slt i32 %12, %13, !dbg !27
  br i1 %14, label %15, label %23, !dbg !28

15:                                               ; preds = %0
  %16 = load volatile i32, i32* @svp_simple_015_001_global_var1, align 4, !dbg !29, !tbaa !14
  %17 = load i32, i32* %1, align 4, !dbg !30, !tbaa !14
  %18 = icmp sgt i32 %16, %17, !dbg !31
  br i1 %18, label %19, label %23, !dbg !32

19:                                               ; preds = %15
  %20 = load i32, i32* %1, align 4, !dbg !33, !tbaa !14
  %21 = load i32, i32* %2, align 4, !dbg !34, !tbaa !14
  %22 = add nsw i32 %20, %21, !dbg !35
  store i32 %22, i32* %3, align 4, !dbg !36, !tbaa !14
  br label %23, !dbg !37

23:                                               ; preds = %19, %15, %0
  %24 = load i32, i32* %4, align 4, !dbg !38, !tbaa !14
  %25 = icmp eq i32 %24, 1, !dbg !39
  br i1 %25, label %26, label %28, !dbg !38

26:                                               ; preds = %23
  %27 = load volatile i32, i32* @svp_simple_015_001_global_var2, align 4, !dbg !40, !tbaa !14
  br label %30, !dbg !38

28:                                               ; preds = %23
  %29 = load volatile i32, i32* @svp_simple_015_001_global_var2, align 4, !dbg !41, !tbaa !14
  br label %30, !dbg !38

30:                                               ; preds = %28, %26
  %31 = phi i32 [ %27, %26 ], [ %29, %28 ], !dbg !38
  %32 = bitcast i32* %4 to i8*, !dbg !42
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #3, !dbg !42
  %33 = bitcast i32* %3 to i8*, !dbg !42
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %33) #3, !dbg !42
  %34 = bitcast i32* %2 to i8*, !dbg !42
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %34) #3, !dbg !42
  %35 = bitcast i32* %1 to i8*, !dbg !42
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %35) #3, !dbg !42
  ret void, !dbg !42
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

declare i32 @rand(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_015_001_isr_1() #0 !dbg !43 {
  call void (...) @idlerun(), !dbg !44
  store volatile i32 5, i32* @svp_simple_015_001_global_var1, align 4, !dbg !45, !tbaa !14
  store volatile i32 5, i32* @svp_simple_015_001_global_var2, align 4, !dbg !46, !tbaa !14
  ret void, !dbg !47
}

declare void @idlerun(...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_015_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_015")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_015_001_main", scope: !8, file: !8, line: 7, type: !9, scopeLine: 7, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_015_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_015")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 8, column: 3, scope: !7)
!11 = !DILocation(line: 10, column: 3, scope: !7)
!12 = !DILocation(line: 10, column: 11, scope: !7)
!13 = !DILocation(line: 10, column: 7, scope: !7)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 11, column: 3, scope: !7)
!19 = !DILocation(line: 11, column: 11, scope: !7)
!20 = !DILocation(line: 11, column: 7, scope: !7)
!21 = !DILocation(line: 12, column: 3, scope: !7)
!22 = !DILocation(line: 13, column: 3, scope: !7)
!23 = !DILocation(line: 13, column: 11, scope: !7)
!24 = !DILocation(line: 13, column: 7, scope: !7)
!25 = !DILocation(line: 15, column: 8, scope: !7)
!26 = !DILocation(line: 15, column: 41, scope: !7)
!27 = !DILocation(line: 15, column: 39, scope: !7)
!28 = !DILocation(line: 15, column: 44, scope: !7)
!29 = !DILocation(line: 16, column: 8, scope: !7)
!30 = !DILocation(line: 16, column: 41, scope: !7)
!31 = !DILocation(line: 16, column: 39, scope: !7)
!32 = !DILocation(line: 15, column: 7, scope: !7)
!33 = !DILocation(line: 17, column: 9, scope: !7)
!34 = !DILocation(line: 17, column: 13, scope: !7)
!35 = !DILocation(line: 17, column: 11, scope: !7)
!36 = !DILocation(line: 17, column: 7, scope: !7)
!37 = !DILocation(line: 17, column: 5, scope: !7)
!38 = !DILocation(line: 19, column: 3, scope: !7)
!39 = !DILocation(line: 19, column: 5, scope: !7)
!40 = !DILocation(line: 19, column: 12, scope: !7)
!41 = !DILocation(line: 19, column: 45, scope: !7)
!42 = !DILocation(line: 20, column: 1, scope: !7)
!43 = distinct !DISubprogram(name: "svp_simple_015_001_isr_1", scope: !8, file: !8, line: 22, type: !9, scopeLine: 22, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 23, column: 3, scope: !43)
!45 = !DILocation(line: 24, column: 34, scope: !43)
!46 = !DILocation(line: 25, column: 34, scope: !43)
!47 = !DILocation(line: 26, column: 1, scope: !43)
